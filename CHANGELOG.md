# Changelog

Chỉ ghi các thay đổi có trong repo này. Nền thư viện vẫn mang version 2.6.5;
ngày bên dưới là ngày publish, không phải version mới của client.

## 2026-10-18 — Daily patrol 4 ô, mainland spawn và sửa tuyến

### Daily / Sky Pillar

- Patrol từ cặp 2 ô thành dải thẳng tối đa 4 ô; bãi hẹp dùng 2–3 ô. Kiểm tra
  mọi ô giữa và đường tiếp cận: đúng subnode/terrain, không NPC/map link.
  Giữ ngân sách local-path mỗi callback, không thêm sleep giữa các bước.
- Sky Pillar 3F được dùng Normal Ground khi không có grass, dù Outside=true.
  Ngoại lệ chỉ cho floor có bằng chứng cache/Land spawn này; không roam mọi
  outdoor town. Giữ điều kiện giờ/membership và Spiritomb member-only.

### Spawn Kanto / Johto / Hoenn / Sinnoh

- Thêm manifest tên map chính xác `MainlandMapScope.json` và hướng dẫn import.
  Giữ Route/hang/Safari/khu gốc; bỏ Love/Pinkan/Sevii và expansion/event,
  bao gồm Route 49/135 của Nap. Không xóa graph/checkpoint tới đảo.
- Lọc dữ liệu remote hiện tại: **5.429 → 3.961 dòng JSON**, loại 161 map /
  1.468 dòng; còn **410 map, 3.960 dòng runtime / 490 Pokémon**.
  Giữ nguyên field/order của mọi dòng còn lại, gồm hai spawn mới trên remote:
  Glameow/Floaroma Meadow và Torkoal/Stark Mountain Entrance Pt.
- Optimizer áp dụng manifest cả khi rebuild sau import, có `--check` chỉ đọc
  và `--report` tùy chọn. Thêm regression Python portable kiểm tra JSON/Lua,
  scope, import tương lai và idempotency; SpawnEditor chưa tự lọc manifest.

### Điều hướng / hội thoại

- Đích có suffix `_A`/`_B` phải khớp đúng node, không hoàn thành sớm chỉ vì
  cùng map vật lý; không đổi hành vi đích generic không suffix.
- Dig: câu hỏi và choices có thể ở callback/frame riêng. Không queue Cancel
  khi mới nhận câu hỏi, chỉ chọn outlet từ menu authoritative rồi tới party
  slot; reset pending khi Stop/đổi cạnh, không dùng lựa chọn từ dialog cũ.
- Đồng bộ graph/MapLink/template chiều dòng nước Hoenn: Pacifidlog → 132 →
  133 → 134 → Slateport. Bỏ các cạnh ngược dòng, không bỏ kiểm tra HM/items.

### Phạm vi publish

- Merge có chọn lọc trên remote mới nhất; giữ dữ liệu Mineral/Historical/Feral,
  CellCrawl và các sửa checkpoint không liên quan của contributor.
- Không kèm Accounts, Logs, backups, settings cá nhân hay script riêng.
  Không sửa Core/protocol/auth/Lua API; không ghi đè workspace người dùng.
- Kiểm tra offline trên chính clone publish; chưa xác minh live-server sau
  bản publish này. Stop → Load lại script → Start để bỏ module require cache.

### Kiểm tra bản publish

- MoonSharp compile **53/53 file Lua**; spawn Python/optimizer read-only,
  baseline field/order, import guard/idempotency và lazy Lua iteration PASS.
- Daily/full dependency smoke, lịch DigRework, actionable route, item readiness,
  Hoenn currents, navigation logs và transport progress PASS trên clone này.
- Fixture Lua Dig split-menu, Floaroma, Route 16 và Meteor alias PASS; đây là
  phần Lua của các runner host, không phải toàn bộ kiểm tra packet/cache của chúng.
- Cache Sky Pillar 3F với Core .NET 10: Outside=true, 0 grass, 76 normal-ground;
  từ `(7,5)` và `(11,11)` đều patrol 4 ô qua 12 action local, không travel,
  từng leg hợp lệ với Core pathfinding. Không suy đoán NPC live từ cache.
- Host Avalonia Desktop Debug/Release `win-x64` build PASS, 0 warnings/errors,
  output riêng; mã host và gói ứng dụng không nằm trong commit này.

## 2026-10-13 — Bug Catching, Dig Coronet/Mt. Silver và transport progress

### Bug Catching daily tùy chọn

- Thêm `BugCatching.lua`, `Lib/BugCatchingScore.lua`, `BUG_CATCHING.md`:
  False Swipe slot 1, rectangle cấu hình, HP IV trước bắt và tổng điểm sau bắt.
  Tier 1–2 top-HP; tier 3–4/shiny/form ném bóng ngay. Không cần Pathfinder.
- Hall PC cleanup khi best mới/đầy đội; giữ catcher/best/shiny/form/score chưa
  biết. PC thật/snapshot/ID/slot/party-ack guards; không chọn storage rows,
  không resend release chậm và không giả party. Người dùng xác nhận lượt thi
  không mất khi đi Hall; bản này chưa được chạy live để xác minh lại.
- Timer 20 phút không reset theo map/Stop–Start; reload phải nhập đúng thời gian
  còn lại. Tắt cleanup dùng quota fallback. Không tự nhận/check/nộp contest.

### Dig Coronet và ưu tiên dịch vụ

- Menu Dig hỗ trợ thường/đánh số/list đánh số gộp dòng; kiểm tra index liên tục
  và đích duy nhất, không hardcode Summit option 3. Route211_A=West, _B=East
  qua `menuName` từng cạnh, không alias/gộp map toàn cục.
- Thiếu/mơ hồ menu hoặc slot Dig sai queue Cancel đã biết hoặc non-slot 0 trước
  khi dừng, tránh host default1. Server xử lý 0 chưa xác minh live.
- Prefer-transport chỉ ép dịch vụ khi access + egress giúp giảm walking cost;
  tránh đi vòng qua ga rồi quay lại thành phố/đích gần. Giữ service flags,
  trọng số và ưu tiên hữu ích ngay cả khi tổng cost dịch vụ cao hơn đi bộ.

### Dig menu và checkpoint Mt. Silver

- Menu Dig được cung cấp có `Mt. Silver Exterior = 1`, `Cancel = 2`, khác
  index 2 trong data cũ. Chọn theo tên đích trong choices authoritative,
  xử lý prompt nằm trong tham số options của host và bỏ màu khi so sánh.
- Tách xác nhận Yes khỏi menu outlet để không prequeue sai lựa chọn; giữ
  đúng slot Dig 1..6. Đích vắng mặt chỉ Cancel theo menu đã xác nhận rồi dùng
  fallback per-edge nếu bật, không đoán option hoặc tắt mọi Dig route.
  Caves một outlet giữ sequence cũ; thiếu choices ở shared burrow báo lỗi rõ.
- Bổ sung checkpoint Mt. Silver 1F B/C ↔ D từ rectangle vùng đích đã có.
  Fuchsia → Moltres Chamber không còn bị strict query loại ở B → D;
  giữ graph/cost, cửa chamber `(21,19)`, Rock Smash và đường quay ra.
- Chỉ merge block Mt. Silver vào MapExceptions công khai: giữ nguyên các
  ngoại lệ Mineral/Historical/Feral và dữ liệu khác trên remote. Không kèm
  Boss.lua, helper BossRoute, profiles/settings cá nhân hoặc file trạng thái.
- Kiểm tra offline trên chính clone publish; không chứng minh walkability/
  server travel hoặc thao tác release live. Kết quả ghi ở mục xác minh bên dưới.

### Xác minh bản publish 2026-10-13

- **53/53 file Lua syntax PASS** trên chính clone publish.
- **9 regression PASS**: Bug Catching (21 base HP, 67.200 tổ hợp IV/level,
  Hall PC fixture và actual Lua host), Dig destination menu/Coronet,
  Mt. Silver checkpoints, transport progress, Dig travel fallback,
  DigRework transport preference, actionable routes, Daily và Floaroma.
- WPF + Avalonia Desktop Debug/Release build PASS cho source host tương ứng;
  package Lua được kiểm tra lại trên clone. Không thực hiện release/đi map live.
- Không kèm Boss, accounts/profiles, file tiến trình, log, backup hoặc Settings
  riêng. Giữ ngoại lệ Excavation/map/spawn hiện có trên remote.

## 2026-10-12

### DigRework và policy di chuyển

- Thêm `digrework.lua` + `Lib/ActiveHarvestRoute.lua`: thu gom Dig/PokeStop/Berry
  chung tuyến, không Excavation; lịch Kanto → Johto → Hoenn → Sinnoh.
- Giữ đích ổn định, lưu kiến thức node đã kiểm tra và hoãn điểm lỗi mà không
  ghi DONE. Không quay lại vùng đã kết thúc chỉ vì timer skip ngắn hết hạn.
- Thêm `getRegion` từ nguồn graph authored; giữ định dạng ba file tiến trình
  và cooldown. Không kèm file trạng thái hay tài khoản thật.
- Policy opt-in `preferTransport`: ưu tiên Subway/Transmat được bật cho hành
  trình tới đích cố định, kể cả cost cao hơn đi bộ; không tạo vòng ga cho công
  việc local. Không thay trọng số, không vượt `USE_SUBWAY`/`USE_TELEPORT`.
- Policy opt-in `digFallback`: skip cạnh Dig một chiều khi tương tác không
  khả dụng hoặc outlet từ chối đã biết; yield rồi tính lại tới cùng đích.
  Giữ các cạnh Dig khác, không ép cửa ngược và không ghi DONE giả.
- `requireActionable` cho phép tour bỏ cạnh thiếu checkpoint/handler trước
  khi đi xa. Preview/dispatch dùng cùng policy, cache phân biệt các options.

### Helper/map đi kèm

- Đồng bộ module điều hướng đang hoạt động và dialog solver từ workspace
  chính. Giữ **graph-cost-only** và **CellCrawl tắt**; không chép đè module
  discovery đang không dùng, dữ liệu Excavation hoặc database spawn trên remote.
- Alias Meteor Falls 1F 1R giữ subnode; sửa snapshot inventory restriction
  tránh mất Bicycle ở các lần tính tuyến xen kẽ.
- Dùng checkpoint LinkExceptions khi thiếu MapLink, giảm spam progress/
  checkpoint bằng các kênh chống lặp độc lập.
- Export `setMount`, `setWaterMount`, `useMount`; tái sử dụng API host,
  không tự dùng water mount trên đất hoặc sửa hành vi Surf của client.
- Route 16 Stop House: sửa hướng cửa A/B. Mt. Mortar 1F: gán NPC DigSpot
  `(57,36)` vào C, không sửa collider/walkability.
- Giữ Daily/Floaroma đã publish và Settings **default-only**. Bổ sung README,
  ignore file tiến trình harvest và backup JSON. Không kèm script cá nhân khác.

### Xác minh

- MoonSharp syntax: **51/51 file Lua PASS**, kiểm tra chính clone publish.
- **9 regression PASS**: Dig travel fallback, transport preference, combined
  harvest, region schedule, actionable routes, navigation log, Meteor alias,
  Daily Solaceon và Floaroma Meadow (bao gồm cache check).
- Mount API smoke PASS: Surf/shore, một action/frame, 1000 mounted ticks,
  cấu hình lỗi/disable/restart. Map smoke PASS: Route 16 B → Stop House → A →
  house và lookup NPC Mt. Mortar `(57,36)`; movement/server được giả lập.
- Real graph Cinnabar → Maze: tuyến cost thường **7.4**, tuyến policy dịch vụ
  **8.3** qua Fuchsia/Pewter Subway; Forest → Maze vẫn trực tiếp cost **1**.
  Route 3 → Route 4: Dig bị từ chối chuyển từ cost **1** sang đường bộ **6.7**,
  giữ cùng đích. Đây là graph cost, không phải thời gian đo trên server.
- 1000 cached dispatch ticks không lặp planning/log/DONE; phép đo offline lần
  publish: **104 ms CPU** tổng, preferred cold query **475 ms CPU**. Không phải
  latency hoặc benchmark UI/live.
- Source host **WPF Debug/Release** và **Avalonia Desktop Debug/Release** build
  PASS trong output riêng; không sửa source host để publish bundle.
- **Chưa xác nhận live sau publish**. Không thay Core, protocol, crypto, auth,
  Lua API host, battle hoặc thuật toán tìm đường theo ô của client.

## 2026-10-10

### Cập nhật Daily Solaceon và Floaroma Meadow

- Thêm script tùy chọn `DailySolaceon.lua` và helper
  `Lib/DailySolaceonHunt.lua`; không đưa các script cá nhân khác vào bundle.
- Daily dùng multi-target search hiện có để chọn node spawn gần nhất theo chi
  phí Pathfinder, giờ và membership; loại fishing-only và bỏ cap 50 map.
- Sửa fall-through tìm cỏ tại map sai khi vừa chọn bãi hoặc travel thất bại;
  chỉ săn khi đã tới chính xác node, không chỉ cùng map vật lý.
- Đổi bãi khi travel bị từ chối lặp lại ở cùng vị trí; patrol hai ô encounter
  liền kề thay vì chạy ngẫu nhiên khắp map. Giới hạn công việc tìm đường mỗi
  callback; giữ luồng quest, bắt Pokémon, PC và file trạng thái.
- Floaroma_B: thêm hàng `(13..35,24)` vào vùng dưới đồi, sửa lỗi lookup tại
  `(24,24)`. Không mở rộng B qua hàng rào lên A.
- Sửa cấu trúc checkpoint Town → Meadow_B thành `{{12,4,13,4}}`.
- Thêm MapLink/MapException A → B tới dải đáp `(20..34,23)`; giữ một chiều,
  B → A vẫn đi vòng qua Route 205 / Fuego Ironworks.
- Bổ sung hướng dẫn update/reload, giới hạn node/`moveToGrass()` và `.gitignore`
  cho Accounts, log, cache, trạng thái cá nhân và backup.
- Giữ nguyên `MoveTo.lua`/CellCrawl, graph-cost-only, cấu hình public default-only
  và dữ liệu không liên quan đã có trên remote; không chép đè snapshot desktop.

#### Kiểm tra đợt cập nhật

- MoonSharp syntax: **49/49 file Lua**; liên kết tài liệu nội bộ hợp lệ.
- Daily regression và real Pathfinder/spawn loader smoke: PASS với chính
  bundle publish, bao gồm `MoveTo.lua` của repo này.
- Floaroma Lua regression/cache: PASS; 23 ô B bổ sung có thể tới từ Town,
  chiều lên trực tiếp bị chặn, link Town khớp cache và tuyến vòng qua Fuego.
- **Chưa xác nhận live sau sửa**. Cache không chứng minh NPC đang hoạt động
  hoặc điều kiện quest/dialog của server. Không đổi protocol, crypto, auth,
  Lua API hoặc thuật toán Pathfinder để vượt rào.

### Bản publish đầu (giữ lịch sử)

#### Đã thêm

- Publish thư mục `Pathfinder/` và `Settings/` từ bản làm việc desktop.
- README: cấu trúc, cài đặt, API tích hợp, cấu hình, xử lý lỗi map và quy tắc publish.
- CHANGELOG theo dõi thay đổi và phân biệt kiểm tra offline với xác nhận live.

#### Feral Site

- Thay phân vùng tọa độ cũ bằng các component của cached map hiện tại.
- Xác định `(13,24)` là `Feral Site_A`, tránh yêu cầu sai tuyến B → A.
- MapExceptions dùng `(19,22)` cho A → B và `(19,24)` cho B → A.
- Thêm ô reset `(19,21)` / `(19,25)` khi người chơi đã đứng trên ô link.
- Bổ sung phân vùng cho các ô excavation NPC không thể đứng trực tiếp lên.

#### Làm sạch bản publish

- `Static_Settings.lua` chỉ giữ profile `default`; bỏ profile/ID cá nhân.
- Không thay đổi cấu hình tài khoản trong bản local khi xuất bản sạch.
- Không publish `Script.lua`, script bên ngoài thư mục hoặc ba file backup.

#### Giới hạn

- CellCrawl đang tắt trong `MoveTo.lua`; bản publish này không tự học map/link.

#### Kiểm tra

- MoonSharp: **47/47 file Lua** qua kiểm tra cú pháp.
- Cấu hình default-only: qua kiểm tra với các tên tài khoản giả lập.
- JSON/Python: parse thành công.
- Feral: 25 excavation NPC xác định được submap; phân vùng A/B không chồng nhau.
- Index Git của lần publish code: 57 file, chỉ thuộc `Pathfinder/` và `Settings/`.

#### Chưa xác nhận live

- Chuyển vùng Feral A ↔ B và bước reset link sau bản sửa.
- Toàn bộ hành trình giữa các map và các dịch vụ transport trên server hiện tại.
