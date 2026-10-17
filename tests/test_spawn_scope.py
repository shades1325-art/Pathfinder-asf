#!/usr/bin/env python3
"""Read-only dataset checks; rebuild fixtures use a temporary directory."""
import importlib.util,json,re,subprocess,sys,tempfile
from pathlib import Path
root=Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).resolve().parents[1]/'Pathfinder'/'Spawn'
backup=Path(sys.argv[2]) if len(sys.argv)>2 and sys.argv[2] else None
spec=importlib.util.spec_from_file_location('optimizer',root/'optimize_spawn_data.py')
opt=importlib.util.module_from_spec(spec); spec.loader.exec_module(opt)
allowed=opt.load_map_scope(root)
assert allowed and len(allowed)==410
positive=['Route 1','Route 28','Route 29','Route 48','Route 101','Route 134',
 'Route 201','Route 230','Route 119A','Route 119B','Route 124 Underwater',
 'Mt. Mortar 1F','Meteor Falls 1F 1R','Old Chateau 2F 5R','Iron Island B1F L',
 'Seafoam B4F','Cinnabar Mansion 1','Mirage Island Lake','Safari Johto Wet Zone',
 'Hoenn Safari Zone Area 1','Sinnoh Safari Area Zone 6']
negative=['Love Island','Diamond Domain 1F','Pinkan Island Forest','One Island',
 'Kindle Road','Berry Forest','Bond Bridge','Altering Cave','Seven Island',
 'Tanoby Ruins Rixy Chamber','Water Path','Water Labyrinth','Moon','Moon 1F',
 'Eumi Island Town','Nap Town','Route 49','Route 135','Trainers Valley',
 'Wastelands','Burring Strait','Matsuki Courtyard','Vulcan Island Shore',
 'Route 301','Route 8 Event','Unknown Future Map']
assert all(m in allowed for m in positive)
assert not any(m in allowed for m in negative)
sources=[]; before_total=after_total=0; removed_maps=set()
for filename,kind in opt.SOURCE_FILES:
 rows=json.loads((root/filename).read_text(encoding='utf-8-sig'))
 assert all(r['Map'] in allowed for r in rows), filename+' still includes an excluded map'
 assert opt.deduplicate(rows)==rows, filename+' has stale/duplicate rows'
 sources.append((kind,rows)); after_total+=len(rows)
 if backup:
  original=json.loads((backup/filename).read_text(encoding='utf-8-sig'))
  expected=[r for r in original if r['Map'] in allowed]
  assert rows==expected,filename+' changed a retained record/order/field'
  before_total+=len(original)
  removed_maps.update(r['Map'] for r in original if r['Map'] not in allowed)

def decode(path):
 text=path.read_text(encoding='utf-8-sig')
 arrays={}
 for name in ('Maps','Items','Tiers','MapTypes','RequiredRods'):
  block=re.search(r'local '+name+r' = \{(.*?)\n\}',text,re.S)[1]
  arrays[name]=[json.loads(s) for s in re.findall(r'^\s*(".*"),?$',block,re.M)]
 block=re.search(r'local PackedSpawnData = \{(.*?)\n\}',text,re.S)[1]
 result={}
 for name,packed in re.findall(r'^\s*\[(".*?")\]\s*=\s*(".*"),?$',block,re.M):
  rows=[]
  for encoded in json.loads(packed).split(';'):
   v=list(map(int,encoded.split(','))); assert len(v)==10
   rows.append({'Pokemon':json.loads(name),'Map':arrays['Maps'][v[0]-1],
    'Morning':v[1]%2,'Day':(v[1]//2)%2,'Night':(v[1]//4)%2,
    'MinLVL':v[2],'MaxLVL':v[3],'Item':arrays['Items'][v[4]-1],
    'Tier':arrays['Tiers'][v[5]-1],'MemberOnly':v[6]==1,
    'MapType':arrays['MapTypes'][v[7]-1],'FishingOnly':v[8],
    'RequiredRod':arrays['RequiredRods'][v[9]-1]})
  result[json.loads(name)]=rows
 return result,arrays['Maps']

actual,maps=decode(root/'SpawnData.lua')
expected=opt.build_runtime_rows(sources)
assert actual==expected,'Lua/JSON drift or retained runtime fields changed'
assert set(maps)<=allowed and not any(m in maps for m in negative)
if backup:
 original,_=decode(backup/'SpawnData.lua')
 retained={p:[r for r in rows if r['Map'] in allowed] for p,rows in original.items()}
 retained={p:rows for p,rows in retained.items() if rows}
 assert actual==retained,'retained runtime records differ from pre-filter baseline'
 print(f'Spawn scope baseline: JSON rows {before_total} -> {after_total}; removed maps={len(removed_maps)}; active maps={len(maps)}')

# Import/rebuild guard: even if an external editor adds an island/unknown map,
# regeneration filters it. This fixture never writes into the user's bundle.
with tempfile.TemporaryDirectory(prefix='spawn-mainland-regression-') as temp:
 temp=Path(temp)
 (temp/opt.MAP_SCOPE_FILE).write_bytes((root/opt.MAP_SCOPE_FILE).read_bytes())
 sample=dict(sources[0][1][0]); sample['Map']='Route 8'
 bad=[dict(sample,Map=m) for m in negative]
 (temp/'LandSpawn.json').write_text(json.dumps([sample]+bad),encoding='utf-8')
 (temp/'SurfSpawn.json').write_text('[]',encoding='utf-8')
 script=root/'optimize_spawn_data.py'
 check=subprocess.run([sys.executable,'-B',str(script),'--directory',str(temp),'--check'],capture_output=True,text=True)
 assert check.returncode==1 and not (temp/'SpawnData.lua').exists()
 assert len(json.loads((temp/'LandSpawn.json').read_text()))==len(bad)+1,'check mutated source JSON'
 run=subprocess.run([sys.executable,'-B',str(script),'--directory',str(temp)],capture_output=True,text=True)
 assert run.returncode==0,run.stderr
 assert json.loads((temp/'LandSpawn.json').read_text())==[sample]
 generated=(temp/'SpawnData.lua').read_bytes()
 run=subprocess.run([sys.executable,'-B',str(script),'--directory',str(temp)],capture_output=True,text=True)
 assert run.returncode==0 and (temp/'SpawnData.lua').read_bytes()==generated,'rebuild not idempotent'
print(f'Spawn mainland data: PASS ({sum(map(len,actual.values()))} runtime rows, {len(actual)} Pokemon; exact retained fields/order, banned islands/routes, read-only check, future-import guard, idempotent regeneration)')
