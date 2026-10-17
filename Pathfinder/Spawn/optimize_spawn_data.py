#!/usr/bin/env python3
"""Deduplicate/minify spawn JSON and build a compact lazy Lua index.

The runtime does not parse LandSpawn.json or SurfSpawn.json directly.  It
loads SpawnData.lua, so merely minifying JSON does not improve PROShine's Lua
startup.  This tool also packs the runtime data into one string per Pokemon;
only the requested Pokemon is expanded into Lua tables.
"""

from __future__ import print_function

import argparse
import json
from collections import OrderedDict
from pathlib import Path


SOURCE_FILES = (("LandSpawn.json", "Land"), ("SurfSpawn.json", "Surf"))
MAP_SCOPE_FILE = "MainlandMapScope.json"


def load_map_scope(root):
    """Exact reviewed map allowlist. No graph-region or name-prefix guesses.

    Older bundles without a scope manifest retain their previous exporter
    behavior. This primary bundle ships the manifest alongside its JSON.
    """
    path = root / MAP_SCOPE_FILE
    if not path.exists():
        return None
    policy = json.loads(path.read_text(encoding="utf-8-sig"))
    regions = policy.get("regions", {})
    if policy.get("schemaVersion") != 1 or set(regions) != {"Kanto", "Johto", "Hoenn", "Sinnoh"}:
        raise ValueError("Invalid mainland spawn map-scope manifest")
    allowed = set()
    for region, maps in regions.items():
        if not isinstance(maps, list) or not maps or any(not isinstance(m, str) or not m.strip() for m in maps):
            raise ValueError("Empty/invalid map allowlist for " + region)
        for name in maps:
            if name in allowed:
                raise ValueError("Duplicate map in scope manifest: " + name)
            allowed.add(name)
    return allowed

# Server spawn rotations can invalidate an individual database row before the
# upstream spawn export is refreshed. Keep those known-stale rows out of both
# JSON and the generated Lua index. Keys are normalized to avoid casing drift.
EXCLUDED_SPAWNS = {
    ("budew", "route 204"),
    ("cacnea", "route 228"),
}


def is_excluded(row):
    pokemon = str(row.get("Pokemon") or "").strip().casefold()
    map_name = str(row.get("Map") or "").strip().casefold()
    return (pokemon, map_name) in EXCLUDED_SPAWNS


def canonical_row(row):
    return json.dumps(row, ensure_ascii=False, sort_keys=True,
                      separators=(",", ":"))


def deduplicate(rows):
    seen = set()
    result = []
    for row in rows:
        if is_excluded(row):
            continue
        key = canonical_row(row)
        if key not in seen:
            seen.add(key)
            result.append(row)
    return result


def lua_string(value):
    # Spawn strings do not contain JSON-only values; JSON string escaping is
    # also valid for the Lua strings consumed by MoonSharp.
    return json.dumps(value, ensure_ascii=False)


def write_lua_array(handle, name, values):
    handle.write("local {} = {{\n".format(name))
    for value in values:
        handle.write("    {},\n".format(lua_string(value)))
    handle.write("}\n\n")


def normalized_runtime_row(row, map_type):
    daytime = list(row.get("Daytime") or (0, 0, 0))
    while len(daytime) < 3:
        daytime.append(0)

    return {
        "Pokemon": str(row.get("Pokemon") or "").strip(),
        "Map": str(row.get("Map") or "").strip(),
        "Morning": 1 if daytime[0] else 0,
        "Day": 1 if daytime[1] else 0,
        "Night": 1 if daytime[2] else 0,
        "MinLVL": int(row.get("MinLVL") or 0),
        "MaxLVL": int(row.get("MaxLVL") or 0),
        "Item": str(row.get("Item") or ""),
        "Tier": str(row.get("Tier") or ""),
        "MemberOnly": bool(row.get("MemberOnly")),
        "MapType": map_type,
        "FishingOnly": int(row.get("FishingOnly") or 0),
        "RequiredRod": str(row.get("RequiredRod") or ""),
    }


def build_runtime_rows(sources):
    grouped = OrderedDict()
    runtime_seen = set()

    for map_type, rows in sources:
        for source_row in rows:
            row = normalized_runtime_row(source_row, map_type)
            if not row["Pokemon"] or not row["Map"]:
                continue

            key = tuple(row[key] for key in (
                "Pokemon", "Map", "Morning", "Day", "Night", "MinLVL",
                "MaxLVL", "Item", "Tier", "MemberOnly", "MapType",
                "FishingOnly", "RequiredRod"))
            if key in runtime_seen:
                continue
            runtime_seen.add(key)
            grouped.setdefault(row["Pokemon"], []).append(row)

    return OrderedDict((name, grouped[name]) for name in sorted(grouped))


def write_spawn_data(path, grouped):
    maps = sorted({row["Map"] for rows in grouped.values() for row in rows})
    items = sorted({row["Item"] for rows in grouped.values() for row in rows})
    tiers = sorted({row["Tier"] for rows in grouped.values() for row in rows})
    map_types = sorted({row["MapType"] for rows in grouped.values() for row in rows})
    rods = sorted({row["RequiredRod"] for rows in grouped.values() for row in rows})

    indexes = {
        "Map": {value: index + 1 for index, value in enumerate(maps)},
        "Item": {value: index + 1 for index, value in enumerate(items)},
        "Tier": {value: index + 1 for index, value in enumerate(tiers)},
        "MapType": {value: index + 1 for index, value in enumerate(map_types)},
        "RequiredRod": {value: index + 1 for index, value in enumerate(rods)},
    }

    temporary = path.with_suffix(path.suffix + ".tmp")
    with temporary.open("w", encoding="utf-8", newline="\n") as handle:
        handle.write("-- Generated by optimize_spawn_data.py. Do not edit by hand.\n")
        handle.write("-- Packed rows are decoded lazily for the requested Pokemon only.\n\n")
        write_lua_array(handle, "Maps", maps)
        write_lua_array(handle, "Items", items)
        write_lua_array(handle, "Tiers", tiers)
        write_lua_array(handle, "MapTypes", map_types)
        write_lua_array(handle, "RequiredRods", rods)

        handle.write("local PackedSpawnData = {\n")
        for pokemon, rows in grouped.items():
            packed_rows = []
            for row in rows:
                time_mask = (row["Morning"]
                             + row["Day"] * 2
                             + row["Night"] * 4)
                values = (
                    indexes["Map"][row["Map"]],
                    time_mask,
                    row["MinLVL"],
                    row["MaxLVL"],
                    indexes["Item"][row["Item"]],
                    indexes["Tier"][row["Tier"]],
                    1 if row["MemberOnly"] else 0,
                    indexes["MapType"][row["MapType"]],
                    row["FishingOnly"],
                    indexes["RequiredRod"][row["RequiredRod"]],
                )
                packed_rows.append(",".join(str(value) for value in values))
            handle.write("    [{}] = {},\n".format(
                lua_string(pokemon), lua_string(";".join(packed_rows))))
        handle.write("}\n\n")

        handle.write(r'''local SpawnData = {}

local function decodePokemon(pokemonName)
    local packed = PackedSpawnData[pokemonName]
    if packed == nil then
        return nil
    end

    local rows = {}
    for encodedRow in string.gmatch(packed, "[^;]+") do
        local values = {}
        for encodedValue in string.gmatch(encodedRow, "[^,]+") do
            values[#values + 1] = tonumber(encodedValue)
        end

        local timeMask = values[2]
        rows[#rows + 1] = {
            Map = Maps[values[1]],
            Morning = timeMask % 2,
            Day = math.floor(timeMask / 2) % 2,
            Night = math.floor(timeMask / 4) % 2,
            MinLVL = values[3],
            MaxLVL = values[4],
            Item = Items[values[5]],
            Tier = Tiers[values[6]],
            MemberOnly = values[7] == 1,
            MapType = MapTypes[values[8]],
            FishingOnly = values[9],
            RequiredRod = RequiredRods[values[10]],
        }
    end

    PackedSpawnData[pokemonName] = nil
    rawset(SpawnData, pokemonName, rows)
    return rows
end

setmetatable(SpawnData, {
    __index = function(_, pokemonName)
        return decodePokemon(pokemonName)
    end,
    __pairs = function()
        local names = {}
        for pokemonName in pairs(PackedSpawnData) do
            names[#names + 1] = pokemonName
        end
        for _, pokemonName in ipairs(names) do
            decodePokemon(pokemonName)
        end
        return next, SpawnData, nil
    end,
})

return SpawnData
''')

    temporary.replace(path)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--directory", type=Path,
                        default=Path(__file__).resolve().parent)
    parser.add_argument("--check", action="store_true",
                        help="Read-only: exit nonzero if source JSON needs scope/dedup cleanup")
    parser.add_argument("--report", type=Path,
                        help="Write row counts and excluded-map audit as JSON")
    args = parser.parse_args()
    root = args.directory.resolve()
    allowed_maps = load_map_scope(root)

    sources = []
    removed = 0
    original_count = 0
    audit = {}
    for filename, map_type in SOURCE_FILES:
        path = root / filename
        rows = json.loads(path.read_text(encoding="utf-8-sig"))
        original_count += len(rows)
        scoped = [row for row in rows if allowed_maps is None or row.get("Map") in allowed_maps]
        excluded_maps = {}
        for row in rows:
            if allowed_maps is not None and row.get("Map") not in allowed_maps:
                name = str(row.get("Map") or "")
                excluded_maps[name] = excluded_maps.get(name, 0) + 1
        optimized = deduplicate(scoped)
        audit[filename] = {"before": len(rows), "after": len(optimized),
                           "scopeRemoved": len(rows) - len(scoped),
                           "excludedMaps": dict(sorted(excluded_maps.items()))}
        removed += len(rows) - len(optimized)
        if not args.check:
            path.write_text(
                json.dumps(optimized, ensure_ascii=False, separators=(",", ":")) + "\n",
                encoding="utf-8", newline="\n")
        sources.append((map_type, optimized))

    grouped = build_runtime_rows(sources)
    if not args.check:
        write_spawn_data(root / "SpawnData.lua", grouped)
    if args.report:
        args.report.write_text(json.dumps(audit, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    runtime_count = sum(len(rows) for rows in grouped.values())
    high_volume = sorted(
        ((name, len(rows)) for name, rows in grouped.items() if len(rows) > 64),
        key=lambda item: (-item[1], item[0]))
    print("JSON rows: {} -> {} (removed {} scope/stale/duplicate rows)".format(
        original_count, original_count - removed, removed))
    print("Runtime rows: {}; Pokemon: {}".format(runtime_count, len(grouped)))
    if allowed_maps is not None:
        print("Mainland map scope: {}; allowed maps: {}".format(MAP_SCOPE_FILE, len(allowed_maps)))
    if high_volume:
        print("High-volume Pokemon (>64 rows): " + ", ".join(
            "{}={}".format(name, count) for name, count in high_volume))
    if args.check and removed:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
