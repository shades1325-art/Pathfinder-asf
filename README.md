# Pathfinder-asf

Thư viện điều hướng Lua dựa trên Pathfinder 2.6.5, dành cho môi trường
Basculegion/PROShine có API Lua tương thích. Repo cung cấp module, dữ liệu map
và cấu hình dùng chung. Thư viện **không phải một script bot chạy độc lập**;
bundle có thêm ba script tùy chọn `DailySolaceon.lua`, `digrework.lua`,
`BugCatching.lua` và helper đi kèm. Bug Catching chạy độc lập, không cần Pathfinder.

## Nội dung

```text
DailySolaceon.lua        -- Script daily tùy chọn
digrework.lua            -- Lịch Dig + PokeStop + Berry, không Excavation
BugCatching.lua          -- Hunt daily Bug Catching + HP IV/score + Hall PC cleanup
Lib/
  DailySolaceonHunt.lua  -- Chọn bãi và patrol cho Daily
  ActiveHarvestRoute.lua -- Điều phối công việc và lịch vùng của DigRework
  BugCatchingScore.lua   -- Tier/base HP, khoảng HP IV và điểm daily
Pathfinder/
  MoveToApp.lua          -- Entry point cho script sử dụng thư viện
  Lib/                  -- Điều hướng, hội thoại và helper
  Maps/                 -- Graph, checkpoint, submap và exception
  Spawn/                -- Dữ liệu spawn và công cụ chỉnh sửa
Settings/
  Static_Settings.lua   -- Cấu hình mặc định, không có profile tài khoản
  WorkSettings.lua      -- Cấu hình công việc/berries
README.md
CHANGELOG.md
BUG_CATCHING.md          -- Cấu hình hunt/PC, giới hạn và timer khi reload
```

Ngoài ba script/helper công khai ở trên, không đưa `Script.lua`, script cá nhân,
bản backup, log hoặc ID tài khoản vào bản phát hành.

## Cài đặt

1. Tải repo hoặc clone:
   ```sh
   git clone https://github.com/shades1325-art/Pathfinder-asf.git
   ```
2. Đặt hai thư mục `Pathfinder/` và `Settings/` cạnh script của bạn.
   Giữ nguyên cấu trúc; chỉ chép `MoveToApp.lua` là không đủ.
   Nếu dùng Daily, chép thêm **cả** `DailySolaceon.lua` và `Lib/DailySolaceonHunt.lua`.
   Nếu dùng DigRework, chép thêm **cả** `digrework.lua` và `Lib/ActiveHarvestRoute.lua`.
   Nếu dùng Bug Catching, chép **cả** `BugCatching.lua` và `Lib/BugCatchingScore.lua`.
   Bug Catching không cần hai thư mục Pathfinder/Settings.
3. Nạp module ở đầu script, trước khi bot bắt đầu chạy.
4. Sau khi cập nhật module/cấu hình, nạp lại script để tránh dùng module đã cache.

Thư viện cần các API do client cung cấp như `registerHook`, `getMapName`,
`getPlayerX`, `getPlayerY`, `moveToCell` và `talkToNpcOnCell`.
Không chạy trực tiếp bằng trình thông dịch Lua thông thường.

Có thể nạp script trực tiếp từ thư mục clone/workspace, chẳng hạn
`D:\Pathfinder-main1\digrework.lua`, miễn giữ các module bên cạnh. **Không cần
chép vào Avalonia AppData** để chạy. Nếu đang dùng bundle trong AppData, đó là
một bản riêng: cập nhật repo không tự cập nhật bản ấy. Sao lưu và giữ cấu hình/
file trạng thái cá nhân khi cập nhật; dùng **Stop → nạp lại script → Start**
để đọc lại module Lua (chỉ Stop/Start có thể vẫn dùng `require` đã cache).

## Sử dụng

Đoạn tích hợp tối thiểu bên trong script riêng:

```lua
local pf = require "Pathfinder/MoveToApp"

function onPathAction()
    return pf.moveTo(getMapName(), "Lilycove City")
end
```

Đây chỉ là ví dụ điều hướng. Script gọi thư viện phải tự xử lý battle,
hồi phục và công việc sau khi đến đích.

| API | Mục đích |
| --- | --- |
| `pf.moveTo(currentMap, destination, options)` | Tiếp tục hành trình; `options` là tùy chọn. |
| `pf.getPath(startNode, destination, options)` | Lấy tuyến và graph cost, không thực hiện di chuyển. |
| `pf.getMapNode(map, x, y)` | Xác định node/submap tại tọa độ. |
| `pf.getRegion(node)` | Vùng từ dữ liệu graph authored, không đoán theo tên map. |
| `pf.mapName()` | Lấy node hiện tại của người chơi. |
| `pf.moveToMapCell(currentMap, destinationMap, x, y)` | Điều hướng đến một ô trên map đích. |
| `pf.setMount(item)`, `pf.setWaterMount(item)` | Chọn mount qua API host; mount đất đồng bộ với cấu hình điều hướng của Pathfinder. |
| `pf.useMount()` | Dùng mount đất đã chọn khi host cho phép; không phải thao tác Surf. |

Các tùy chọn opt-in, không thay trọng số hoặc cấu hình persistent:

```lua
local options = {
    requireActionable = true, -- chỉ dùng cạnh có checkpoint/handler
    preferTransport = true,  -- ưu tiên Subway/Transmat đang bật
    digFallback = true       -- bỏ qua đường tắt Dig bị từ chối và tính lại
}
-- Trong onPathAction; vẫn kiểm tra đến đích theo state thực tế.
return pf.moveTo(pf.mapName(), "Viridian Maze", options)
```

`preferTransport` chỉ dùng dịch vụ được `USE_SUBWAY`/`USE_TELEPORT` cho phép.
Nếu tuyến thường chưa dùng dịch vụ, policy so sánh các tuyến tiếp cận → dịch vụ
→ đích không lặp node, kể cả graph cost cao hơn đi bộ; không có tuyến dịch vụ
hợp lệ thì dùng tuyến thường. Forest → Maze không bị biến thành vòng đi ga.
`digFallback` có hiệu lực lúc di chuyển, không phải một action trong `getPath`.
Không truyền options thì không bật các policy opt-in này.

Chỉ thực hiện **một action mỗi callback**. Khi lời gọi trả `true`, hãy kết thúc
callback ngay; action được gửi/queued không đồng nghĩa server đã hoàn tất.
`false` cũng không tự chứng minh đã đến đích: kiểm tra map/node và vị trí thực tế.

Tên node `_A`, `_B`, `_C` là phân vùng của Pathfinder, không nhất thiết là tên
map server. Dùng `getMapNode` thay vì tự chia map chỉ theo trục Y.

## Cấu hình

Chỉnh profile `default` trong `Settings/Static_Settings.lua`:

| Tùy chọn | Ý nghĩa |
| --- | --- |
| `MOUNT` | Mount dùng khi di chuyển. |
| `DISCOVER`, `HARVEST`, `HEADBUTT`, `DIG` | Bật/tắt công việc tương ứng khi đi đường. |
| `USE_SUBWAY` | Cho phép các cạnh subway. |
| `USE_TELEPORT` | Cho phép các cạnh teleport/Transmat. |
| `K_SUBWAY`, `J_SUBWAY`, `H_SUBWAY` | Trọng số tuyến subway theo vùng. |
| `J_TO_K`, `H_TO_KJ` | Trọng số kết nối liên vùng được cấu hình trong graph. |

Trọng số là chi phí đánh giá tuyến, **không phải số tiền bị trừ**. Tăng trọng số
không đồng nghĩa cấm tuyến. Nếu tài khoản không dùng được subway/Transmat,
đặt tùy chọn `USE_*` tương ứng thành `false`.

Bản công khai chỉ giữ `default`. Nếu cần profile theo tài khoản, thêm ở bản local
và loại bỏ trước khi commit; không đưa tên/ID cá nhân hoặc thông tin đăng nhập lên Git.

## Chỉnh map và xử lý lỗi

- `Maps/{region}/*Map.lua`: các node, cạnh, trọng số và điều kiện của graph.
- `Maps/MapLink.lua`: checkpoint nguồn cho các cạnh di chuyển thông thường.
- `Maps/MapExceptions/SubstituteMaps.lua`: vùng tọa độ của từng submap.
- `Maps/MapExceptions/MapExceptions.lua`: action cho các cạnh đặc biệt cùng map.
- `Maps/MapExceptions/NpcExceptions.lua`: tương tác NPC và hội thoại theo tuyến.

Graph có cạnh chưa đủ để bot đi được: checkpoint cũng phải đúng và có thể tiếp cận
từ node nguồn. `MapExceptions` được xử lý trước `MapLink`; chỉ sửa
`LinkExceptions.lua` không đảm bảo thay đổi action đang thực hiện.

### Feral Site

- A là component có lối vào/cart; `(13,24)` vẫn thuộc **A**.
- A → B đi vào `(19,22)`; B → A đi vào `(19,24)`.
- Nếu đã đứng trên ô link, exception dùng ô reset `(19,21)` hoặc `(19,25)`
  để bước ra trước khi bước lại vào link.
- Không thay phân vùng hiện tại bằng một đường cắt Y đơn giản.

### Floaroma Meadow

- A ở trên đồi, B ở dưới; vách nhảy chỉ cho đi A → B.
- Từ B lên A đi vòng qua Floaroma Town → Route 205 → Fuego Ironworks.
  Không thêm cạnh leo ngược hoặc gộp hai vùng.
- B bao gồm hàng `(13..35,24)`, sửa lookup bị thiếu tại `(24,24)`.
- Checkpoint Town → B dùng `{{12,4,13,4}}`; cạnh A → B có MapLink và
  MapException tới dải đáp `(20..34,23)`, tránh bị bỏ qua do cùng map vật lý.
- `moveToGrass()` không biết tuyến qua subnode/map khác. Script phải tới đúng
  node trước khi săn; `pf.isSameMap()` không chứng minh đã tới đúng vùng.

### Daily Solaceon tùy chọn

- Chọn node spawn gần nhất theo chi phí Pathfinder đang cấu hình; chỉ xét
  spawn đúng giờ, membership và không fishing-only. Không cắt danh sách 50 map.
- Giữ đích ổn định khi đi đường; không tìm cỏ ở map hiện tại khi vừa chọn bãi
  hoặc đi tới bãi thất bại. Hai lần từ chối tại cùng vị trí sẽ đổi tuyến/bãi.
- Patrol dải thẳng **tối đa 4 ô encounter** (2–3 ô nếu bãi hẹp), đi qua lại
  giữa hai đầu trong đúng node. Kiểm tra cả ô giữa, NPC, map link và đường
  tiếp cận trước mỗi action; không chọn cỏ/rectangle ngẫu nhiên trên toàn map.
- Land dùng grass, hoặc normal ground trong nhà khi không có grass hợp lệ;
  Surf dùng water. Riêng **Sky Pillar 3F** có Land spawn trên plain floor dù
  map được đánh dấu Outside; không mặc định mọi normal ground ngoài trời có
  encounter. Giữ nguyên điều kiện giờ/membership, kể cả Spiritomb member-only.
- Giới hạn 24 local-path checks / 8 blocked-route searches mỗi callback.
  Không thêm thời gian chờ giữa các bước patrol thành công.
- Giữ luồng quest/bắt Pokémon/PC và file trạng thái; cập nhật script cùng helper.

Script cần API host Basculegion hiện tại, gồm `waitForState`, `getCellType`,
`isNpcOnCell` và các hàm thời gian/membership. Nó không thêm API mới vào client.
Bãi không có hai ô encounter liền kề có thể tới được sẽ bị bỏ qua; hết ứng viên
sẽ dừng có lý do. Encounter ground trong nhà là suy luận từ dữ liệu Land/cell
type, không phải bảng spawn từng ô từ server.

### Spawn chỉ 4 vùng chính

Index spawn chỉ giữ **Kanto, Johto, Hoenn, Sinnoh**: Route, hang, Safari và
các khu gốc như Cinnabar, Seafoam, Mirage, Iron Island. Loại Love, Pinkan,
Sevii và các khu expansion/event (kể cả Route 49/135 của Nap). Manifest dùng
tên map chính xác, không suy luận từ tên file regional graph. Không xóa graph
đi lại tới các đảo; chỉ giới hạn ứng viên spawn của Daily/hunt.

Bản publish có **410 map / 3.961 dòng JSON / 3.960 dòng runtime / 490 Pokémon**.
Giữ nguyên field/thứ tự của từng dòng hợp lệ, bao gồm Glameow/Floaroma Meadow
và Torkoal/Stark Mountain Entrance Pt mới trên remote. Xem
[Pathfinder/Spawn/README.md](Pathfinder/Spawn/README.md) để import/rebuild an toàn.

### Bug Catching tùy chọn

Tự vào Bug Catching Area với catcher biết **False Swipe ở slot 1**, đủ bóng,
rồi Start `BugCatching.lua`. Tier 1–2 chỉ chọn nhóm HP cao nhất theo species +
level (wild EV HP=0); tier 3–4/shiny/form ném bóng ngay. HP cho **khoảng IV**,
không chứng minh IV31 hoặc tổng 6 IV cao; score chính xác được đọc sau capture.

Mặc định `AUTO_PC_CLEANUP=true`: có best mới/đầy đội thì ra Hall qua cửa Area
`(36,56)`, dùng PC gần `(10,10)` rồi vào lại qua `(24,5)`. Người dùng xác nhận
giữ nguyên lượt thi khi đi Hall; chưa có live trace mới từ bản phát hành này.
Giữ catcher/best/shiny/form/con chưa chấm điểm; chỉ release từng party slot sau
khi PC thật có snapshot, chờ server cập nhật party rồi mới chọn con tiếp.
**Chỉ mang catcher và catches của lượt contest**; con thường ngoài lượt ở
slot 2–6 có thể bị release vĩnh viễn. Không chọn Pokémon trong storage/box rows.

Tắt cleanup để dùng quota fallback (2 catches thường tier 1–2, mở 3 phút cuối).
Timer local tối đa 20 phút, không reset khi đi Hall/Stop–Start cùng Lua VM;
**reload phải chỉnh `MINUTES_REMAINING` đúng thời gian còn lại**. Bạn tự nhận/
check điểm/nộp bài. Xem [hướng dẫn và giới hạn đầy đủ](BUG_CATCHING.md).

### DigRework tùy chọn

- Dùng chung một bộ điều phối cho `getActiveDigSpots`, `getActivePokestop` và
  `getActiveBerryTrees`; không Excavation/cart hoặc tự dùng Escape Rope.
- Lịch cố định **Kanto → Johto → Hoenn → Sinnoh**. Trong vùng đang đến lượt,
  chọn công việc còn lại theo graph cost và giữ đích khi di chuyển; có thể
  thu gom điểm local cùng vùng trên đường. Không chọn lại đích sau mỗi bước.
- `PREFER_TRANSPORT = true`: ưu tiên Subway/Teleport khi được bật trong Settings.
  Chọn công việc vẫn dùng graph cost thường để không bỏ qua việc ngay cạnh;
  policy dịch vụ chỉ áp dụng hành trình tới đích đã chọn.
  Chỉ ép tuyến dịch vụ nếu chi phí đi bộ access + egress giảm so với tuyến
  thường; không vòng qua ga khác rồi quay lại thành phố/đích gần ban đầu.
  Không yêu cầu tổng cost dịch vụ thấp hơn đi bộ và không đổi trọng số graph.
- `FALLBACK_DIG_PATH = true`: nếu không có Dig hợp lệ, NPC không sẵn sàng,
  tương tác bị từ chối/lỗi hoặc gặp câu từ chối outlet đã biết, bỏ qua **cạnh
  Dig một chiều đó** trong RAM, nhường tick rồi tính lại tới **cùng đích**.
  Không đánh dấu công việc DONE, không tắt mọi đường Dig và không ép khám phá
  cửa ngược khi đến bằng đường bộ. Các dịch vụ đang bật vẫn được ưu tiên.
- Không có tuyến thay thế thì hoãn công việc theo lịch. Điểm bị chặn không
  khiến script quay về vùng trước sau vài giây; vòng mới chờ cooldown thu gom
  thật hoặc lần Start mới. Danh sách cạnh Dig bị bỏ qua xóa khi Start/Stop.
- Xác nhận hết điểm bằng nhiều snapshot API hợp lệ; chỉ ghi DONE đúng node/vùng
  đã kiểm tra. API lỗi, thiếu node hoặc di chuyển thất bại không phải DONE.
- Danh sách Berry nằm trong `BERRY_MAPS` của script; **không tự tạo database map
  berries**. API chỉ cho biết các điểm đang active trên map hiện tại. Sửa các
  danh sách `DIG_MAPS`, `POKESTOP_MAPS`, `BERRY_MAPS` nếu muốn thay phạm vi chạy.
- Giữ ba file `<account>_digspot_status.txt`, `<account>_pokestop_status.txt`,
  `<account>_berry_status.txt`, record `DONE:<node>:<timestamp>` và cooldown
  Dig 3 ngày / PokeStop 2 ngày / Berry 4 ngày. Các file này không đưa lên Git.

Nạp script cùng toàn bộ module phiên bản này. Cần các API active-harvest và
`waitForState` của host Basculegion tương thích. Với host có
`tryTalkToNpcOnCell`, Dig travel dùng binding không fatal; host cũ kiểm tra NPC
trước lời gọi legacy. Không suy đoán dialog lạ là thất bại và không thêm
timeout tùy tiện. Lịch này không phải lời giải tối ưu toàn cục theo thời gian:
graph cost không phải số giây; map đã kiểm tra vẫn có thể là điểm trung gian
cần thiết của tuyến (Maze chỉ nối với Forest).

### Map/helper đồng bộ thêm

- Dig chung Route 22 / Indigo Plateau / Mt. Silver chọn theo **tên đích trong
  menu server**, không giữ index cố định: Mt. Silver Exterior có thể là option
  1, còn option 2 là Cancel. Đọc `choices.prompt` khi message rỗng; xác nhận
  Yes riêng rồi mới chọn outlet và slot Dig. Cần host hỗ trợ tham số choices
  hiện có của `onDialogMessage`; thiếu menu thì báo lỗi thay vì chọn bừa.
  Khi bật `digFallback`, đích không có trong menu được Cancel theo index đã
  xác nhận và skip cạnh đó; giữ đích hành trình và các Dig shortcut khác.
- Mt. Silver 1F B/C ↔ D dùng rectangle vùng đích đã có trong `SubstituteMaps`.
  Strict route không loại nhầm đường tới Moltres Chamber vì placeholder cost;
  giữ cửa `(21,19)`, điều kiện Rock Smash của cạnh B ↔ C và chiều quay ra khi
  thiếu Escape Rope. Không thêm graph edge hay bỏ kiểm tra checkpoint.
- Dig Mt. Coronet hỗ trợ menu có số thứ tự hoặc list đánh số gộp nhiều dòng;
  chọn index thật của đích, không mặc định Summit luôn ở mục 3. Nhãn menu
  Route 211_A=West, Route 211_B=East chỉ áp dụng đúng cạnh, không gộp node.
  Menu thiếu/mơ hồ hoặc slot Dig sai sẽ queue Cancel đã biết hoặc non-slot 0
  trước khi dừng để tránh host default 1. Server xử lý 0 chưa xác minh live;
  có thể cần tự đóng dialog. Không queue party slot khi chưa nhận diện đích.
- Đích ghi rõ suffix `_A`/`_B` phải tới đúng node; cùng map vật lý không
  còn được xem là hoàn thành sớm. Đích không suffix vẫn giữ cách dùng cũ.
- Câu hỏi Dig và danh sách lựa chọn có thể tới ở hai callback riêng: chờ
  choices authoritative rồi mới chọn outlet/party slot, không queue Cancel
  chỉ vì callback câu hỏi chưa kèm menu. Reset trạng thái khi Stop/đổi cạnh.
- Dòng nước Hoenn chỉ theo chiều Pacifidlog → Route 132 → 133 → 134 → Slateport;
  bỏ cạnh/checkpoint đi ngược dòng, kể cả khi có Dive. Muốn quay về phía đông
  dùng Route 131 hoặc dịch vụ hợp lệ.
- Alias chính xác `Meteor Falls 1F 1R` → tên graph legacy `Meteor falls 1F 1R`,
  giữ phân biệt `_A`, `_B`, ...; không đổi tên mọi map một cách mù quáng.
- Route 16 Stop House: cửa tây `(0,6)` → A/nhà Yorkie, cửa đông `(20,6)` → B.
- Mt. Mortar 1F: NPC DigSpot `(57,36)` thuộc C để API xác định đúng node;
  không thay collider hoặc làm ô tường thành ô đi được.
- Checkpoint `LinkExceptions` được dùng nếu chưa có `MapLink`; cạnh thiếu
  checkpoint không thắng tuyến authored chỉ nhờ chi phí fallback nhỏ.
- Tách chống lặp log progress/checkpoint; refresh inventory restriction mỗi
  lần tính tuyến, tránh làm mất Bicycle đã sở hữu ở lần gọi xen kẽ.

### Giới hạn hiện tại

- CellCrawl tự học link đang **tắt trong `MoveTo.lua`**, dù file module vẫn có trong repo.
- Giữ `USE_GRAPH_COST_ONLY = true`: gần nhất theo trọng số graph của bản công
  khai, không tự chuyển sang chế độ cộng khoảng cách đi bộ của bản desktop khác.
- Dữ liệu map là dữ liệu authored, không tự đồng bộ khi server đổi map.
- Kiểm tra cú pháp/offline không chứng minh mọi tuyến hoạt động trên server.
- Chuyển vùng Feral A ↔ B sau bản sửa vẫn cần xác nhận bằng trace live mới.

Khi báo lỗi, gửi tên script/module đang nạp, map/node nguồn và đích, tọa độ người
chơi, checkpoint bị lỗi và một đoạn log ngắn. Không gửi thông tin đăng nhập.

## Kiểm tra và đóng góp

Kiểm tra spawn độc lập (Python 3; chạy từ thư mục repo, không cần host):

```sh
python -B Pathfinder/Spawn/optimize_spawn_data.py --check
python -B tests/test_spawn_scope.py
```

Regression kiểm tra scope, JSON/Lua nhất quán, import map lạ bị loại và rebuild
lặp ổn định trong thư mục tạm; không sửa dữ liệu đang dùng. Có thể truyền
`tests/test_spawn_scope.py <Spawn-directory> <baseline-directory>` để so thêm
từng field/thứ tự của các dòng được giữ với bản sao trước lọc.

Bản publish đầu đã qua kiểm tra cú pháp MoonSharp **47/47 file Lua**, cấu hình
default-only và parse JSON/Python. Không có bộ test live-server tự động trong repo.

Đợt Daily/Floaroma đã kiểm tra với regression trong source Basculegion, chạy
bằng `-ScriptRoot` trỏ tới chính clone repo này (không dùng thư viện thay thế):

```powershell
# Chạy từ source Basculegion đã build Debug; thay đường dẫn clone của bạn.
powershell -NoProfile -ExecutionPolicy Bypass -File tests/DailySolaceonHuntRegression.ps1 -ScriptRoot 'D:\Pathfinder-asf'
powershell -NoProfile -ExecutionPolicy Bypass -File tests/FloaromaMeadowPathfinderRegression.ps1 -ScriptRoot 'D:\Pathfinder-asf'
```

Đợt DigRework chạy thêm `DigTravelFallbackRegression`,
`DigReworkTransportPreferenceRegression`, `DigReworkCombinedRegression`,
`HarvestRegionScheduleRegression`, `PathfinderActionableRouteRegression`,
`PathfinderNavigationLogRegression` và `MeteorFallsMapNameRegression` cùng cách
truyền `-ScriptRoot` tới clone publish. Xem kết quả theo ngày trong changelog.

Hotfix Dig menu/Mt. Silver được kiểm tra thêm bằng
`DigDestinationMenuRegression` và `MtSilverBossRouteRegression` từ source host,
vẫn trỏ `-ScriptRoot` tới chính clone publish. Chưa xác minh đi Dig/Mt. Silver
live sau sửa. Cập nhật module rồi **Stop → Load lại script → Start** để xóa
require cache; không cần xóa tiến trình hay mở lại outlet đã có.

Đợt 2026-10-13 kiểm tra thêm `BugCatchingRegression` (calculator/policy/Hall PC
và Lua host), `PathfinderTransportProgressRegression` và menu Dig Coronet có
số/gộp dòng; mọi runner đều trỏ vào chính clone publish. Test PC dùng fixture
mô phỏng, không thực hiện release live. Không kèm runner cần source host vào repo.

Các runner phụ thuộc MoonSharp/Core trong source host, không được kèm như test
standalone của repo này. Kiểm tra cache Floaroma báo SKIP nếu không có map cache.
Kết quả offline không chứng minh NPC/quest hoặc hành trình hiện tại trên server.

Giữ thay đổi nhỏ, kiểm tra đúng call chain và chỉ stage các đường dẫn cần thiết:

```sh
git add -- Pathfinder DailySolaceon.lua digrework.lua Lib/DailySolaceonHunt.lua Lib/ActiveHarvestRoute.lua README.md CHANGELOG.md .gitignore
```

Trước khi push, kiểm tra `git diff --cached` và làm sạch profile cá nhân trong
`Static_Settings.lua`. Không dùng `git add .` để gom script/log ngoài phạm vi.

Xem [CHANGELOG.md](CHANGELOG.md) để biết lịch sử bản phát hành.
