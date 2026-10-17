# Spawn — chỉ 4 vùng chính

Phạm vi: **Kanto, Johto, Hoenn, Sinnoh**.
Giữ Route, thành phố, hang, Safari và các khu gốc như Cinnabar, Seafoam,
Mirage Island, Iron Island. Không giới hạn theo thế hệ Pokémon: một Pokémon
thế hệ mới vẫn được giữ nếu có spawn trong map thuộc phạm vi này.

## Dữ liệu publish 2026-10-18

- `LandSpawn.json`: 3.447 -> **2.560** dòng.
- `SurfSpawn.json`: 1.982 -> **1.401** dòng (giữ cả fishing trong map được phép).
- Tổng JSON: **5.429 -> 3.961** dòng, giữ field và thứ tự từng record hợp lệ.
- `SpawnData.lua`: index lazy của bot, **3.960 dòng / 490 Pokémon**.
  Runtime loại một record tương đương khi chuẩn hóa; JSON không mất record đó.
- Tổng map: **571 -> 410**; loại **161 map**, tương ứng **1.468 dòng JSON**.
- Giữ hai spawn mới trên remote: Glameow/Floaroma Meadow và
  Torkoal/Stark Mountain Entrance Pt.
- `MainlandMapScope.json`: danh sách **tên map chính xác** chia theo 4 vùng.
  Giữ nguyên spelling/casing của nguồn, không đổi tên map hoặc nội dung row.
  Map mới/chưa được duyệt không được tự thêm chỉ vì nằm trong regional graph.

Đã loại Love/Pinkan và toàn bộ Sevii (kể cả Kindle Road, Water Path, Tanoby,
Berry Forest...), event và expansion như Moon, Eumi, Leev, Nap, Trainers Valley,
Valley Of Steel, Dragonspiral, Matsuki và Vulcan. Route 49/135 thuộc hành lang
Nap cũng bị loại theo phạm vi đã chốt. Route chính 1–48, 101–134, 201–230 và
các biến thể có trong nguồn (North/South/Desert/Underwater/119A/119B/131 B) được giữ.
Không tạo spawn mới cho Route/map chưa có trong nguồn.

Không dùng `getRegion()`/tên file KantoMap.lua làm bộ lọc: regional graph cũng
chứa đảo phụ. Không xoá hay sửa graph/checkpoint, nên Universal Travel vẫn có
thể tới các đảo khi người dùng chủ động yêu cầu. Dữ liệu spawn của các map đó
không còn làm ứng viên cho Daily/hunt dùng index này.

## Khi cập nhật Spawn sau này

Chạy từ thư mục repo:

```powershell
python -B Pathfinder/Spawn/optimize_spawn_data.py --check
python -B Pathfinder/Spawn/optimize_spawn_data.py --report scope-audit.json
python -B tests/test_spawn_scope.py
```

`--check` không sửa JSON/Lua, trả mã 1 nếu cần lọc/dedup. Lệnh không có
`--check` lọc JSON và tái tạo Lua theo cùng manifest. `--report` tuỳ chọn xuất
audit riêng: số dòng trước/sau và tên map bị loại, không phải dữ liệu runtime.
Sao lưu các file dữ liệu trước khi import/rebuild; không commit audit/backup.

SpawnEditor vẫn mở/chỉnh dữ liệu đã lọc bình thường. Nếu import dump đầy đủ
hoặc dùng editor export trực tiếp, phải chạy lại optimizer ở trên trước khi
load script: editor **không tự áp dụng manifest**. Không chỉnh `SpawnData.lua`
bằng tay; thay đổi sẽ mất khi rebuild. Giữ manifest cùng JSON và optimizer.
Bundles cũ không có manifest giữ hành vi exporter cũ; bản này có manifest.

Các file `*.backup.json`/`SpawnData.backup.lua` là bản lưu cũ, không được bot
load; không tự xoá hay lọc các bản lưu đó và không đưa lên Git.
Không tự đồng bộ sang bản AppData/runtime riêng; giữ cấu hình cá nhân khi cập nhật.
**Stop -> Load lại script -> Start** để xoá require cache.

## Nguồn và giới hạn

Đối chiếu mục Routes/Notable sites/Expansionary areas trên PRO Wiki:
[Kanto](https://wiki.pokemonrevolution.net/Kanto),
[Johto](https://wiki.pokemonrevolution.net/Johto),
[Hoenn](https://wiki.pokemonrevolution.net/Hoenn),
[Sinnoh](https://wiki.pokemonrevolution.net/Sinnoh),
[Sevii](https://wiki.pokemonrevolution.net/Sevii_Islands).
Wiki có thể xếp đảo phụ vào category của vùng chính; các ví dụ loại/giữ do
người dùng xác nhận là chính sách quyết định, không phải category đơn thuần.
Tên floor/room lấy nguyên từ JSON hiện tại; không đoán floor có đường đi.
Đây là lọc phạm vi dữ liệu hiện có, không xác nhận spawn/level/rarity hiện tại
trên server và không bổ sung dữ liệu từ wiki vào những dòng được giữ.

## Regression portable

Chạy từ thư mục repo (Python 3; không cần host). Có thể truyền thêm thư mục
baseline trước lọc để so từng field/thứ tự của các dòng giữ lại:

```powershell
python -B tests/test_spawn_scope.py
python -B tests/test_spawn_scope.py Pathfinder/Spawn /path/to/baseline
```

Baseline chứa `LandSpawn.json`, `SurfSpawn.json` và `SpawnData.lua` trước lọc;
không đưa baseline lên Git.
Regression kiểm tra JSON/Lua không còn map ngoài phạm vi, decoded runtime
khớp JSON, `--check` chỉ đọc, rebuild lặp ổn định và import map lạ bị lọc.
Fixtures chạy trong thư mục tạm; không sửa dữ liệu đang dùng. Kiểm tra thực
thi lazy Lua/Daily thuộc regression MoonSharp của source host, không nằm trong
runner Python này. Kết quả offline không xác minh spawn live trên server.
