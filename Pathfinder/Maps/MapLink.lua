local mapLink = {}

--mapLink["Area Name"] = {
--	["Link Area Name"] = {{X, Y}},
--	["Link Area Name"] = {{minX, minY, maxX, maxY}},
--}

--Pokemon Tower Basement
--Gamecorner
--ss anne
--silph co
--cerulean cave
--mt silver
local K_SUBWAY = {19, 12}
local H_TELE = {8, 3}
local S_TELE = {1, 13}
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- KANTO --------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------


mapLink["Berry Tower Reception Kanto"] = {["Route 13_A"] = {{10, 20, 11, 20}}}
mapLink["Bike Road House 1f"] = {["Route 16 Stop House"] = {{11, 9}}}
mapLink["Bike Road Stop 1f"] = {["Bike Road Stop"] = {{9, 9}}}
mapLink["Bike Road Stop"] = {["Bike Road Stop 1f"] = {{8, 9}}, ["Route 18_A"] = {{0, 6, 0, 7}}, ["Route 18_B"] = {{10, 6, 10, 7}}}
mapLink["Bills House"] = {["Route 25"] = {{9, 13, 10, 13}}}
mapLink["Celadon City_A"] = {["Celadon Gamecorner Stairs"] = {{39, 30}}, ["Celadon Gamecorner Prize Center"] = {{44, 30}}, ["Celadon House"] = {{43, 43}}, ["Celadon Office 1F"] = {{43, 19}}, ["Route 16_B"] = {{0, 41, 0, 43}}, ["Celadon Mart 1"] = {{24, 20}}, ["Pokecenter Celadon"] = {{52, 19}}, ["Route 7"] = {{71, 23, 71, 25}}}
mapLink["Celadon City_B"] = {["CeladonGym"] = {{21, 50}}}
mapLink["Celadon Gamecorner Prize Center"] = {["Celadon City_A"] = {{3, 7}}}
mapLink["Celadon Gamecorner Stairs"] = {["Celadon City_A"] = {{7, 15}}}
mapLink["Celadon House"] = {["Celadon City_A"] = {{6, 10, 7, 10}}}
mapLink["Celadon Mart 1"] = {["Celadon Mart 2"] = {{1, 4}}, ["Celadon City_A"] = {{8, 15, 9, 15}}, ["Celadon Mart Elevator"] = {{9, 2}}}
mapLink["Celadon Mart 2"] = {["Celadon Mart 1"] = {{1, 4}}, ["Celadon Mart Elevator"] = {{9, 2}}, ["Celadon Mart 3"] = {{16, 4}}}
mapLink["Celadon Mart 3"] = {["Celadon Mart 2"] = {{1, 4}}, ["Celadon Mart 4"] = {{16, 4}}, ["Celadon Mart Elevator"] = {{9, 2}}}
mapLink["Celadon Mart 4"] = {["Celadon Mart 5"] = {{16, 4}}, ["Celadon Mart Elevator"] = {{9, 2}}, ["Celadon Mart 3"] = {{1, 4}}}
mapLink["Celadon Mart 5"] = {["Celadon Mart Elevator"] = {{9, 2}}, ["Celadon Mart 4"] = {{1, 4}}, ["Celadon Mart 6"] = {{16, 4}}}
mapLink["Celadon Mart 6"] = {["Celadon Mart 5"] = {{18, 12}}}
--mapLink["Celadon Mart Elevator"] = {["Celadon Mart 2"] = {0.2}, ["Celadon Mart 1"] = {0.2}, ["Celadon Mart 4"] = {0.2}, ["Celadon Mart 3"] = {0.2}, ["Celadon Mart 5"] = {0.2}}
mapLink["Celadon Office 1F"] = {["Celadon City_A"] = {{7, 15}}, ["Celadon Office 2F"] = {{14, 11}}, ["Celadon Office Elevator 1"] = {{4, 2}}}
mapLink["Celadon Office 2F"] = {["Celadon Office 1F"] = {{18, 11}}, ["Celadon Office Elevator 1"] = {{3, 2}}, ["Celadon Office Elevator 2"] = {{8, 2}}}
mapLink["Celadon Office 3F"] = {["Celadon Office Elevator 1"] = {{4, 2}}, ["Celadon Office Elevator 2"] = {{8, 2}}}
--mapLink["Celadon Office Elevator 1"] = {["Celadon Office 1F"] = {0.2}, ["Celadon Office 2F"] = {0.2}, ["Celadon Office 3F"] = {0.2}}
--mapLink["Celadon Office Elevator 2"] = {["Celadon Office Roof Top"] = {0.2}, ["Celadon Office 2F"] = {0.2}, ["Celadon Office 3F"] = {0.2}}
mapLink["Celadon Office Roof Top"] = {["Know It All Mans Room"] = {{8, 6}}, ["Celadon Office Elevator 2"] = {{20, 11}}}
mapLink["CeladonGym"] = {["Celadon City_B"] = {{8, 30}}}
mapLink["Cerulean City Bike Shop"] = {["Cerulean City_A"] = {{6, 15}}}
mapLink["Cerulean City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Pokecenter Cerulean"] = {{19, 12}}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}}
mapLink["Cerulean City_A"] = {["Cerulean City Bike Shop"] = {{15, 38}}, ["Cerulean Gym"] = {{35, 32}}, ["Cerulean House 6"] = {{46, 21}}, ["Cerulean House 5"] = {{29, 40}}, ["Cerulean House 4"] = {{35, 23}}, ["Cerulean House 3"] = {{20, 30}}, ["Cerulean House 2"] = {{25, 17}}, ["Cerulean House 1"] = {{19, 17}, {20, 15}}, ["Pokecenter Cerulean"] = {{26, 30}}, ["Route 9"] = {{58, 29, 58, 31}}, ["Route 5_B"] = {{7, 50, 9, 50}, {22, 50, 24, 50}}, ["Route 5_A"] = {{13, 50, 18, 50}}, ["Route 24_B"] = {{39, 0, 40, 0}}, ["Cerulean Pokemart"] = {{24, 40}}, ["Route 4"] = {{0, 19, 0, 21}}}
mapLink["Cerulean City_B"] = {["Route 24_A"] = {{32, 0, 37, 0}}, ["Route 4"] = {{0, 12, 0, 16}}, ["Cerulean Cave 1F_A"] = {{5, 9}}}

mapLink["Cerulean Cave 1F_A"] = {["Cerulean City_B"] = {{49, 39}}, ["Cerulean Cave 2F_A"] =  {{37, 29}}, ["Cerulean Cave 2F_B"] = {{11, 23}}, ["Cerulean Cave 2F_C"] = {{17, 16}}, ["Cerulean Cave 2F_D"] = {{53, 12}}, ["Cerulean Cave 2F_E"] = {{45, 25}}}
mapLink["Cerulean Cave 1F_B"] = {["Cerulean Cave 2F_A"] = {{13, 12}}, ["Cerulean Cave B1F"] = {{11, 15}}}
mapLink["Cerulean Cave 1F_C"] = {["Cerulean Cave B1F"] = {{54, 22}}, ["Cerulean City_B"] = {{49, 39}}}

mapLink["Cerulean Cave 2F_A"] = {["Cerulean Cave 1F_A"] = {{37, 28}}, ["Cerulean Cave 1F_B"] = {{11, 9}}}
mapLink["Cerulean Cave 2F_B"] = {["Cerulean Cave 1F_A"] = {{11, 26}}}
mapLink["Cerulean Cave 2F_C"] = {["Cerulean Cave 1F_A"] = {{17, 16}}}
mapLink["Cerulean Cave 2F_D"] = {["Cerulean Cave 1F_A"] = {{51, 9}}}
mapLink["Cerulean Cave 2F_E"] = {["Cerulean Cave 1F_A"] = {{49, 36}}}

mapLink["Cerulean Cave B1F"] = {["Cerulean Cave 1F_B"] = {{8, 17}}, ["Cerulean Cave 1F_C"] = {{53, 17}}}

mapLink["Cerulean Gym"] = {["Cerulean City_A"] = {{10, 25, 11, 25}}}
mapLink["Cerulean House 1"] = {["Cerulean City_A"] = {{3, 10}, {6, 3}}}
mapLink["Cerulean House 2"] = {["Cerulean City_A"] = {{3, 10}}}
mapLink["Cerulean House 3"] = {["Cerulean City_A"] = {{3, 10}}}
mapLink["Cerulean House 4"] = {["Cerulean City_A"] = {{3, 10}}}
mapLink["Cerulean House 5 2f"] = {["Cerulean House 5"] = {{9, 5}}}
mapLink["Cerulean House 5"] = {["Cerulean City_A"] = {{3, 10}}, ["Cerulean House 5 2f"] = {{9, 5}}}
mapLink["Cerulean House 6"] = {["Cerulean City_A"] = {{3, 10}}}
mapLink["Cerulean Pokemart"] = {["Cerulean City_A"] = {{5, 12, 6, 12}}}
mapLink["Cinnabar Gym B1F"] = {["Cinnabar Gym"] = {{7, 5}}}
mapLink["Cinnabar Gym"] = {["Cinnabar Island"] = {{27, 24}}, ["Cinnabar Gym B1F"] = {{6, 5}}}
mapLink["Cinnabar Island"] = {["Cinnabar Gym"] = {{28, 16}}, ["Cinnabar mansion 1_A"] = {{18, 14}}, ["Cinnabar Lab"] = {{8, 26}}, ["Pokecenter Cinnabar"] = {{19, 26}}, ["Cinnabar Pokemart"] = {{25, 24}}, ["Route 21"] = {{7, 0, 10, 0}}, ["Route 20_A"] = {{45, 23, 45, 28}}}
mapLink["Cinnabar Lab Room 1"] = {["Cinnabar Lab"] = {{8, 14}}}
mapLink["Cinnabar Lab Room 2"] = {["Cinnabar Lab"] = {{8, 14}}}
mapLink["Cinnabar Lab Room 3"] = {["Cinnabar Lab"] = {{8, 14}}}
mapLink["Cinnabar Lab"] = {["Cinnabar Lab Room 3"] = {{34, 9}}, ["Cinnabar Lab Room 2"] = {{26, 9}}, ["Cinnabar Lab Room 1"] = {{18, 9}}, ["Cinnabar Island"] = {{6, 15}}}
mapLink["Cinnabar Pokemart"] = {["Cinnabar Island"] = {{4, 11}}}
mapLink["Cinnabar mansion 1_A"] = {["Cinnabar Island"] = {{10, 42}}, ["Cinnabar mansion 2"] = {{12, 17}}}
mapLink["Cinnabar mansion 1_B"] = {["Cinnabar Island"] = {{39, 42}}, ["Cinnabar mansion B1F_B"] = {{29, 35}}}
mapLink["Cinnabar mansion 2"] = {["Cinnabar mansion 1_A"] = {{4, 19}}, ["Cinnabar mansion 3_B"] = {{9, 4}}, ["Cinnabar mansion 3_A"] = {{9, 19}}}
mapLink["Cinnabar mansion 3_A"] = {["Cinnabar mansion 2"] = {{11, 11}}}
mapLink["Cinnabar mansion 3_B"] = {["Cinnabar mansion 2"] = {{6, 4}}, ["Cinnabar mansion B1F_A"] = {{21, 19}}}
mapLink["Cinnabar mansion B1F_A"] = {["Cinnabar mansion 1_B"] = {{36, 30}}}
mapLink["Cinnabar mansion B1F_B"] = {["Cinnabar mansion 1_B"] = {{36, 30}}}
mapLink["Digletts Cave Entrance 1"] = {["Digletts Cave"] = {{24, 19}}, ["Route 2_B"] = {{15, 28}}}
mapLink["Digletts Cave Entrance 2"] = {["Route 11"] = {{20, 28}}, ["Digletts Cave"] = {{20, 14}}}
mapLink["Digletts Cave"] = {["Digletts Cave Entrance 2"] = {{52, 56}}, ["Digletts Cave Entrance 1"] = {{27, 16}}}
mapLink["Fisherman House - Vermilion Top"] = {["Fisherman House - Vermilion"] = {{8, 3}}}
mapLink["Fisherman House - Vermilion"] = {["Vermilion City_A"] = {{5, 11, 6, 11}}, ["Fisherman House - Vermilion Top"] = {{10, 3}}}
mapLink["Fuchsia City Stop House"] = {["Route 19_A"] = {{6, 20, 7, 20}}, ["Fuchsia City"] = {{6, 3, 7, 3}}}
mapLink["Fuchsia City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Pokecenter Fuchsia"] = {{19, 12}}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Cerulean City Subway"] = {K_SUBWAY}}
mapLink["Fuchsia City"] = {["Move Deleter House"] = {{19, 38}}, ["Fuchsia Gym"] = {{13, 38}}, ["Fuchsia Pokemart"] = {{15, 18}}, ["Safari Stop"] = {{35, 5, 36, 5}}, ["Fuchsia City Stop House"] = {{22, 44, 23, 44}}, ["Fuchsia House 1"] = {{45, 36}}, ["Pokecenter Fuchsia"] = {{30, 39}}, ["Route 15 Stop House"] = {{67, 25, 67, 26}}, ["Route 18_B"] = {{0, 26, 0, 28}}}
mapLink["Fuchsia Gym"] = {["Fuchsia City"] = {{6, 16, 7, 16}}}
mapLink["Fuchsia House 1"] = {["Fuchsia City"] = {{5, 11}}}
mapLink["Fuchsia Pokemart"] = {["Fuchsia City"] = {{6, 12, 7, 12}}}
--mapLink["Golds Gym Vitamin Shop"] = {["Golds Gym"] = {1}}
mapLink["Golds Gym"] = {["Saffron City"] = {{26, 15}}, ["Golds Gym Vitamin Shop"] = {1}}
mapLink["Guild House"] = {["Saffron City"] = {{4, 10, 5, 10}}}
--mapLink["Hall Of Fame B1F"] = {["Hall Of Fame"] = {1}, ["Hall Of Fame B2F"] = {1}}
--mapLink["Hall Of Fame B2F"] = {["Hall Of Fame B1F"] = {1}}
--mapLink["Hall Of Fame"] = {["Lavender Town"] = {1}, ["Hall Of Fame B1F"] = {1}}
mapLink["Indigo Plateau Center Johto"] = {["Indigo Plateau"] = {{10, 28}}}
mapLink["Indigo Plateau Center"] = {["Indigo Plateau"] = {{10, 28}}}
mapLink["Indigo Plateau"] = {["Indigo Plateau Center Johto"] = {{10, 12}}, ["Indigo Plateau Center"] = {{32, 12}}, ["Victory Road Kanto 3F_B"] = {{21, 31}}}
mapLink["Item Maniac House"] = {["Route 25"] = {{4, 9}}}
mapLink["Jail"] = {["Pewter City"] = {{16, 20}}}
--mapLink["Kanto Daycare"] = {["Route 5_A"] = {1}}
mapLink["Kanto Safari Zone Area 1 Building 1"] = {["Safari Entrance_A"] = {{5, 10, 6, 10}}}
mapLink["Know It All Mans Room"] = {["Celadon Office Roof Top"] = {{7, 10, 8, 10}}}
mapLink["Lavender Pokemart"] = {["Lavender Town"] = {{4, 11}}}
mapLink["Lavender Town Costume Mart 2"] = {["Lavender Town"] = {{4, 8}}}
mapLink["Lavender Town Costume Mart"] = {["Lavender Town"] = {{4, 8}}}
mapLink["Lavender Town House"] = {["Lavender Town"] = {{4, 10}}}
mapLink["Lavender Town Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pokecenter Lavender"] = {{19, 12}}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Cerulean City Subway"] = {K_SUBWAY}}
mapLink["Lavender Town Volunteer House"] = {["Lavender Town"] = {{5, 12}}}
mapLink["Lavender Town"] = {["Lavender Town House"] = {{5, 18}}, ["Hall Of Fame"] = {{22, 16}}, ["Lavender Town Costume Mart"] = {{10, 18}}, ["Lavender Town Costume Mart 2"] = {{25, 10}}, ["Lavender Town Volunteer House"] = {{10, 12}}, ["Lavender Pokemart"] = {{3, 5}}, ["Route 10_C"] = {{14, 0, 17, 0}}, ["Route 12"] = {{14, 25, 16, 25}}, ["Pokecenter Lavender"] = {{9, 5}}, ["Pokemon Tower 1F"] = {{21, 5}}, ["Route 8_A"] = {{0, 9, 0, 12}}}

mapLink["Move Deleter House"] = {["Fuchsia City"] = {{6, 9, 7, 9}}}
mapLink["Mt. Moon 1F"] = {["Mt. Moon B1F_A"] = {{58, 33}}, ["Mt. Moon B1F_D"] = {{21, 20}}, ["Route 3"] = {{38, 63}}, ["Mt. Moon B1F_C"] = {{37, 29}}}
mapLink["Mt. Moon B1F_A"] = {["Mt. Moon B2F_C"] = {{43, 34}}, ["Mt. Moon 1F"] = {{18, 15}}}
mapLink["Mt. Moon B1F_B"] = {["Mt. Moon B2F_A"] = {{32, 21}}, ["Mt. Moon Exit"] = {{41, 20}}}
mapLink["Mt. Moon B1F_C"] = {["Mt. Moon B2F_B"] = {{57, 21}}, ["Mt. Moon 1F"] = {{65, 20}}}
mapLink["Mt. Moon B1F_D"] = {["Mt. Moon 1F"] = {{75, 15}}, ["Mt. Moon B2F_A"] = {{56, 34}}}
mapLink["Mt. Moon B2F_A"] = {["Mt. Moon B1F_D"] = {{38, 40}}, ["Mt. Moon B1F_B"] = {{17, 27}}}
mapLink["Mt. Moon B2F_B"] = {["Mt. Moon B1F_C"] = {{44, 30}}}
mapLink["Mt. Moon B2F_C"] = {["Mt. Moon B1F_A"] = {{30, 54}}}
mapLink["Mt. Moon Exit"] = {["Route 4"] = {{14, 7}}, ["Mt. Moon B1F_B"] = {{4, 5}}}

mapLink["Mt. Silver 1F_A"] = {["Mt. Silver Lower Mountainside"] = {{56, 47}}, ["Mt. Silver Exterior"] = {{45, 63}}}
mapLink["Mt. Silver 1F_B"] = {["Mt. Silver 1F_C"] = {0.5, {["abilities"] = {"rock smash"}}}, ["Mt. Silver 1F_D"] = {0.5}, ["Mt. Silver 2F_A"] = {{36, 16}}, ["Mt. Silver Lower Mountainside"] = {{58, 43}}}
mapLink["Mt. Silver 1F_C"] = {["Mt. Silver 1F_B"] = {0.5, {["abilities"] = {"rock smash"}}}, ["Mt. Silver 1F_D"] = {0.5}, ["Mt. Silver Expert Belt"] = {{40, 48}}}
mapLink["Mt. Silver 1F_D"] = {["Mt. Silver 1F_B"] = {0.5}, ["Mt. Silver 1F_C"] = {0.5}, ["Mt. Silver Moltres Chamber"] = {{21, 19}}}
mapLink["Mt. Silver 1F_E"] = {["Mt. Silver Lower Mountainside"] = {{60, 29}}}
mapLink["Mt. Silver Moltres Chamber"] = {["Mt. Silver 1F_D"] = {{25, 35}}}
mapLink["Mt. Silver 2F_A"] = {["Mt. Silver 1F_B"] = {{32, 35}}, ["Mt. Silver Upper Mountainside_A"] = {{32, 14}}}
mapLink["Mt. Silver 2F_B"] = {["Mt. Silver Upper Mountainside_A"] = {{51, 20}}}
mapLink["Mt. Silver 2F_C"] = {["Mt. Silver Upper Mountainside_A"] = {{51, 32}}, ["Mt. Silver Upper Mountainside_B"] = {{51, 45}}}
mapLink["Mt. Silver 2F_D"] = {["Mt. Silver Upper Mountainside_B"] = {42, 51}}
mapLink["Mt. Silver Exterior"] = {["Route 28_B"] = {{35, 10}}, ["Mt. Silver Pokecenter"] = {{24, 9}}, ["Route 28_A"] = {{35, 19}}, ["Mt. Silver 1F_A"] = {{15, 4}}}
mapLink["Mt. Silver Lower Mountainside"] = {["Mt. Silver 1F_A"] = {{22, 34}}, ["Mt. Silver 1F_B"] = {{18, 28}}, ["Mt. Silver 1F_E"] = {14, 12}}
mapLink["Mt. Silver Pokecenter"] = {["Mt. Silver Exterior"] = {{8, 22}}}
mapLink["Mt. Silver Expert Belt"] = {["Mt. Silver 1F_C"] = {{20, 23}}}

mapLink["Mt. Silver 3F"] = {["Mt. Silver Summit"] = {1}, ["Mt. Silver Upper Mountainside_B"] = {1}}
mapLink["Mt. Silver Summit"] = {["Mt. Silver 3F"] = {1}}
mapLink["Mt. Silver Upper Mountainside_A"] = {["Mt. Silver 2F_C"] = {1}, ["Mt. Silver 2F_A"] = {1}, ["Mt. Silver 2F_B"] = {1}}
mapLink["Mt. Silver Upper Mountainside_B"] = {["Mt. Silver 2F_C"] = {1}, ["Mt. Silver 3F"] = {1--[[npc talk]]}, ["Mt. Silver 2F_D"] = {1}}

mapLink["New Bark Town"] = {["Route 27_A"] = {1, {["abilities"] = {"surf"}}}}
mapLink["Oaks Lab"] = {["Pallet Town"] = {{7, 12}}}
mapLink["Pallet Town"] = {["Oaks Lab"] = {{22, 21}}, ["Rivals House"] = {{22, 12}}, ["Player House Pallet"] = {{6, 12}}, ["Route 21"] = {{10, 30, 14, 30}}, ["Route 1"] = {{12, 0, 16, 0}}}
mapLink["Pewter City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pokecenter Pewter"] = {{19, 12}}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Cerulean City Subway"] = {K_SUBWAY}}
mapLink["Pewter City"] = {["Pewter Gym"] = {{23, 21}}, ["Pewter Museum"] = {{28, 9}}, ["Jail"] = {{59, 7}}, ["Pewter House 2"] = {{49, 17}}, ["Pewter House 1"] = {{11, 41}}, ["Pokecenter Pewter"] = {{24, 35}}, ["Pewter Pokemart"] = {{37, 26}}, ["Route 2_A"] = {{14, 55, 17, 55}}, ["Route 3"] = {{65, 31, 65, 36}}}
mapLink["Pewter Gym"] = {["Pewter City"] = {{7, 14}}}
mapLink["Pewter House 1"] = {["Pewter City"] = {{6, 10, 7, 10}}}
mapLink["Pewter House 2"] = {["Pewter City"] = {{6, 10, 7, 10}}}
mapLink["Pewter Museum"] = {["Pewter City"] = {{9, 18}}}
mapLink["Pewter Pokemart"] = {["Pewter City"] = {{6, 12, 7, 12}}}
mapLink["Player Bedroom Pallet"] = {["Player House Pallet"] = {{12, 4}}}
mapLink["Player House Pallet"] = {["Player Bedroom Pallet"] = {{12, 3}}, ["Pallet Town"] = {{4, 10}}}
mapLink["Pokecenter Celadon"] = {["Celadon City_A"] = {{8, 22, 9, 22}}, ["Celadon City Subway"] = {{2, 20}}}
mapLink["Pokecenter Cerulean"] = {["Cerulean City Subway"] = {{2, 20}}, ["Cerulean City_A"] = {{8, 22, 9, 22}}}
mapLink["Pokecenter Cinnabar"] = {["Cinnabar Island"] = {{8, 22, 9, 22}}}
mapLink["Pokecenter Fuchsia"] = {["Fuchsia City Subway"] = {{2, 20}}, ["Fuchsia City"] = {{8, 22, 9, 22}}}
mapLink["Pokecenter Lavender"] = {["Lavender Town"] = {{8, 22, 9, 22}}, ["Lavender Town Subway"] = {{2, 20}}}
mapLink["Pokecenter Pewter"] = {["Pewter City"] = {{8, 22, 9, 22}}, ["Pewter City Subway"] = {{2, 20}}}
mapLink["Pokecenter Route 10"] = {["Route 10_A"] = {{8, 22, 9, 22}}}
mapLink["Pokecenter Route 3"] = {["Route 3"] = {{8, 22, 9, 22}}}
mapLink["Pokecenter Saffron"] = {["Saffron City"] = {{8, 22, 9, 22}}, ["Saffron City Subway"] = {{2, 20}}}
--mapLink["Pokecenter Trainers Valley"] = {["Trainers Valley"] = {1}}
mapLink["Pokecenter Vermilion"] = {["Vermilion City_A"] = {{8, 22, 9, 22}}, ["Vermilion City Subway"] = {{2, 20}}}
mapLink["Pokecenter Viridian"] = {["Viridian City Subway"] = {{2, 20}}, ["Viridian City"] = {{8, 22, 9, 22}}}
mapLink["Pokemon Club"] = {["Vermilion City_A"] = {{8, 11}}}
mapLink["Pokemon League Reception Gate"] = {["Route 28_A"] = {{1, 10, 1, 11}}, ["Route 26_A"] = {{22, 24, 23, 24}}, ["Victory Road Kanto 1F"] = {{22, 2, 23, 2}}, ["Route 22"] = {{43, 10, 43, 11}}}
mapLink["Pokemon Tower 1F"] = {["Lavender Town"] = {{9, 19}}, ["Pokemon Tower 2F"] = {{17, 11}}, ["Pokemon Tower B1"] = {{9, 4}}}
mapLink["Pokemon Tower 2F"] = {["Pokemon Tower 1F"] = {{17, 13}}, ["Pokemon Tower 3F"] = {{1, 13}}}
mapLink["Pokemon Tower 3F"] = {["Pokemon Tower 4F"] = {{17, 13}}, ["Pokemon Tower 2F"] = {{1, 13}}}
mapLink["Pokemon Tower 4F"] = {["Pokemon Tower 3F"] = {{17, 13}}, ["Pokemon Tower 5F"] = {{1, 13}}}
mapLink["Pokemon Tower 5F"] = {["Pokemon Tower 6F"] = {{17, 13}}, ["Pokemon Tower 4F"] = {{1, 13}}}
mapLink["Pokemon Tower 6F"] = {["Pokemon Tower 5F"] = {{17, 13}}, ["Pokemon Tower 7F"] = {{8, 19}}}
mapLink["Pokemon Tower 7F"] = {["Pokemon Tower 6F"] = {{8, 19}}}
mapLink["Pokemon Tower B1"] = {["Pokemon Tower 1F"] = {{17, 16}}, ["Pokemon Tower B2"] = {{23, 22}}}
--[[mapLink["Pokemon Tower B10_A"] = {["Pokemon Tower B9_B"] = {1}, ["Pokemon Tower B9_A"] = {1}}
mapLink["Pokemon Tower B10_B"] = {["Pokemon Tower B11"] = {1}}
mapLink["Pokemon Tower B11"] = {["Pokemon Tower B1"] = {1}, ["Pokemon Tower B12"] = {1}}
mapLink["Pokemon Tower B12"] = {["Pokemon Tower B13"] = {1}}
mapLink["Pokemon Tower B13"] = {["Pokemon Tower B14"] = {1}}
mapLink["Pokemon Tower B14"] = {["Pokemon Tower B15"] = {1}}
mapLink["Pokemon Tower B15"] = {["Pokemon Tower B16"] = {1}}
mapLink["Pokemon Tower B16"] = {["Pokemon Tower B17_A"] = {1}}
mapLink["Pokemon Tower B17_A"] = {["Pokemon Tower B17_B"] = {1}}
mapLink["Pokemon Tower B17_B"] = {["Pokemon Tower B1"] = {1}, ["Pokemon Tower B18"] = {1}}
mapLink["Pokemon Tower B18"] = {["Pokemon Tower B19_A"] = {1}, ["Pokemon Tower B19_C"] = {1}, ["Pokemon Tower B19_B"] = {1}}
mapLink["Pokemon Tower B19_A"] = {["Pokemon Tower B18"] = {1}}
mapLink["Pokemon Tower B19_B"] = {["Pokemon Tower B20_A"] = {1}, ["Pokemon Tower B18"] = {1}, ["Pokemon Tower B20_B"] = {1}}
mapLink["Pokemon Tower B19_C"] = {["Pokemon Tower B18"] = {1}}
mapLink["Pokemon Tower B2"] = {["Pokemon Tower B3_A"] = {1}}
mapLink["Pokemon Tower B20_A"] = {["Pokemon Tower B21"] = {1}}
mapLink["Pokemon Tower B20_B"] = {["Pokemon Tower B19_B"] = {1}}
mapLink["Pokemon Tower B21"] = {["Pokemon Tower B23"] = {1}}
mapLink["Pokemon Tower B22"] = {["Pokemon Tower B24"] = {1}, ["Pokemon Tower B13"] = {1}}
mapLink["Pokemon Tower B23"] = {["Pokemon Tower B22"] = {1}}
mapLink["Pokemon Tower B24"] = {["Pokemon Tower B1"] = {1}, ["Pokemon Tower B29"] = {1}}
mapLink["Pokemon Tower B29"] = {["Pokemon Tower B1"] = {1}, ["Pokemon Tower Underground"] = {1}}
mapLink["Pokemon Tower B3_A"] = {["Pokemon Tower B3_B"] = {0}}
mapLink["Pokemon Tower B3_B"] = {["Pokemon Tower B3_C"] = {0}}
mapLink["Pokemon Tower B3_C"] = {["Pokemon Tower B4"] = {0}}
mapLink["Pokemon Tower B4"] = {["Pokemon Tower B6"] = {1}}
mapLink["Pokemon Tower B6"] = {["Pokemon Tower B7"] = {1}}
mapLink["Pokemon Tower B7"] = {["Pokemon Tower B8"] = {1}, ["Pokemon Tower B3_B"] = {1}}
mapLink["Pokemon Tower B8"] = {["Pokemon Tower B9_A"] = {1}}
mapLink["Pokemon Tower B9_A"] = {["Pokemon Tower B10_A"] = {1}}
mapLink["Pokemon Tower B9_B"] = {["Pokemon Tower B10_B"] = {1}}
mapLink["Pokemon Tower Underground"] = {["Pokemon Tower B29"] = {1}}]]
mapLink["Power Plant"] = {["Route 10_B"] = {{5, 39}, {0, 11}}}
mapLink["Psychic House"] = {["Saffron City"] = {{4, 10, 5, 10}}}
mapLink["Rivals House 2F"] = {["Rivals House"] = {{12, 4}}}
mapLink["Rivals House"] = {["Pallet Town"] = {{4, 10}}, ["Rivals House 2F"] = {{12, 3}}}
mapLink["Rock Tunnel 1_A"] = {["Rock Tunnel 2_A"] = {{35, 16}}, ["Route 10_A"] = {{43, 11}}}
mapLink["Rock Tunnel 1_B"] = {["Rock Tunnel 2_B"] = {{8, 15}}, ["Rock Tunnel 2_A"] = {{7, 7}}}
mapLink["Rock Tunnel 1_C"] = {["Route 10_C"] = {{21, 32}}, ["Rock Tunnel 2_B"] = {{7, 30}}}
mapLink["Rock Tunnel 2_A"] = {["Rock Tunnel 1_B"] = {{7, 5}}, ["Rock Tunnel 1_A"] = {{36, 16}}}
mapLink["Rock Tunnel 2_B"] = {["Rock Tunnel 1_C"] = {{8, 26}}, ["Rock Tunnel 1_B"] = {{10, 13}}}
mapLink["Route 1 Stop House"] = {["Viridian City"] = {{3, 2, 4, 2}}, ["Route 1"] = {{3, 12, 4, 12}}}
mapLink["Route 1"] = {["Pallet Town"] = {{13, 50, 17, 50}}, ["Route 1 Stop House"] = {{13, 4, 14, 4}}}
mapLink["Route 10_A"] = {["Route 9"] = {{21, 0, 24, 0}}, ["Rock Tunnel 1_A"] = {{11, 5}}, ["Pokecenter Route 10"] = {{18, 4}}}
mapLink["Route 10_B"] = {["Route 9"] = {{27, 0, 30, 0}}, ["Power Plant"] = {{15, 26}}}
mapLink["Route 10_C"] = {["Lavender Town"] = {{14, 71, 17, 71}}, ["Rock Tunnel 1_C"] = {{5, 44}}}
mapLink["Route 11 Stop House 1f"] = {["Route 11 Stop House"] = {{9, 9}}}
mapLink["Route 11 Stop House"] = {["Route 11 Stop House 1f"] = {{8, 9}}, ["Route 11"] = {{0, 6, 0, 7}}, ["Route 12"] = {{10, 6, 10, 7}}}
mapLink["Route 11"] = {["Vermilion City_A"] = {{0, 12, 0, 15}}, ["Digletts Cave Entrance 2"] = {{10, 12}}, ["Route 11 Stop House"] = {{83, 18, 83, 19}}}
mapLink["Route 12 House"] = {["Route 12"] = {{3, 10, 4, 10}}}
mapLink["Route 12"] = {["Route 12 House"] = {{17, 58}}, ["Lavender Town"] = {{14, 0, 16, 0}}, ["Route 13_A"] = {{23, 92, 25, 92}}, ["Route 11 Stop House"] = {{1, 47, 1, 48}}}
mapLink["Route 13_A"] = {["Berry Tower Reception Kanto"] = {{17, 12, 18, 12}}, ["Route 12"] = {{93, 0, 95, 0}}, ["Route 14_A"] = {{17, 34, 24, 34}}}
--mapLink["Route 13_B"] = {["Route 13_A"] = {0}}
mapLink["Route 14_A"] = {["Route 13_A"] = {{17, 0, 23, 0}}, ["Route 15"] = {{0, 46, 0, 55}}}
--mapLink["Route 14_B"] = {["Route 14_A"] = {0}}
mapLink["Route 15 Stop House"] = {["Route 15"] = {{10, 6, 10, 7}}, ["Fuchsia City"] = {{0, 6, 0, 7}}}
mapLink["Route 15"] = {["Route 15 Stop House"] = {{6, 16, 6, 17}}, ["Route 14_A"] = {{94, 22, 94, 31}}}
-- West door reaches Route 16_A (Yorkie's house); east door returns to Celadon/B.
mapLink["Route 16 Stop House"] = {["Bike Road House 1f"] = {{19, 9}}, ["Route 16_B"] = {{20, 6}}, ["Route 16_A"] = {{0, 6}}}
mapLink["Route 16 house"] = {["Route 16_A"] = {{3, 9, 4, 9}}}
mapLink["Route 16_A"] = {["Route 16 Stop House"] = {{64, 12, 64, 13}}, ["Route 16 house"] = {{31, 14}}, ["Route 17"] = {{29, 40, 33, 40}}}
mapLink["Route 16_B"] = {["Route 16 Stop House"] = {{70, 12, 70, 13}}, ["Celadon City_A"] = {{90, 19, 90, 20}}}
mapLink["Route 17"] = {["Route 18_A"] = {{12, 170, 16, 170}}, ["Route 16_A"] = {{11, 0, 15, 0}}}
mapLink["Route 18_A"] = {["Route 17"] = {{14, 0, 18, 0}}, ["Bike Road Stop"] = {{29, 16, 29, 17}}}
mapLink["Route 18_B"] = {["Fuchsia City"] = {{50, 15, 50, 17}}, ["Bike Road Stop"] = {{35, 16, 35, 17}}}
mapLink["Route 19_A"] = {["Fuchsia City Stop House"] = {{22, 3, 23, 3}}, ["Route 20_B"] = {{0, 37, 0, 46}}}
mapLink["Route 19_B"] = {["Fuchsia City Stop House"] = {{22, 3, 23, 3}}, ["Route 20_B"] = {{0, 37, 0, 46}}}
mapLink["Route 2 House"] = {["Route 2_B"] = {{4, 12}}}
mapLink["Route 2 Stop"] = {["Viridian Forest"] = {{3, 2, 4, 2}}, ["Route 2_C"] = {{3, 12, 4, 12}}}
mapLink["Route 2 Stop2"] = {["Route 2_A"] = {{3, 2, 4, 2}}, ["Viridian Forest"] = {{3, 12, 4, 12}}}
mapLink["Route 2 Stop3"] = {["Route 2_B"] = {{3, 2, 4, 2}}, ["Route 2_D"] = {{3, 12, 4, 12}}}
mapLink["Route 20_A"] = {["Seafoam 1F_A"] = {{73, 40}}, ["Cinnabar Island"] = {{0, 28, 0, 34}}}
mapLink["Route 20_B"] = {["Seafoam 1F_B"] = {{60, 32}}, ["Route 19_B"] = {{120, 24, 120, 33}}}
mapLink["Route 21"] = {["Cinnabar Island"] = {{4, 95, 8, 95}, {15, 95, 19, 95}}, ["Pallet Town"] = {{10, 0, 14, 0}}}
mapLink["Route 22"] = {["Viridian City"] = {{60, 10, 60, 12}}, ["Pokemon League Reception Gate"] = {{9, 7, 9, 8}}}
mapLink["Route 24_A"] = {["Route 25"] = {{7, 0, 9, 0}}, ["Cerulean City_B"] = {{7, 31, 12, 31}}}
mapLink["Route 24_B"] = {["Route 25"] = {{14, 0, 15, 0}}, ["Cerulean City_A"] = {{14, 31, 15, 31}}}
mapLink["Route 24_C"] = {["Route 25"] = {{22, 0, 25, 0}}, ["Cerulean City_A"] = {{22, 31, 28, 31}}}
mapLink["Route 25"] = {["Route 24_A"] = {{7, 30, 9, 30}}, ["Route 24_B"] = {{14, 30, 15, 30}}, ["Route 24_C"] = {{22, 30, 25, 30}}, ["Item Maniac House"] = {{114, 7}}, ["Bills House"] = {{99, 7}}, ["Route 25 Cave"] = {{17, 8}}}
mapLink["Route 25 Cave"] = {["Route 25"] = {{6, 13}}}
--[[mapLink["Route 26 House 2"] = {["Route 26_A"] = {1}}
mapLink["Route 26 House1"] = {["Route 26_A"] = {1}}
mapLink["Route 26_A"] = {["Route 26 House1"] = {1}, ["Route 26 House 2"] = {1}, ["Route 26_B"] = {0.7}, ["Route 27_B"] = {1.5}, ["Pokemon League Reception Gate"] = {1.5}}
mapLink["Route 26_B"] = {["Route 27_B"] = {0.3}}
mapLink["Route 27 House1"] = {["Route 27_B"] = {1}}
mapLink["Route 27_A"] = {["New Bark Town"] = {1, {["abilities"] = {"surf"}}}, ["Tohjo Falls"] = {1, {["abilities"] = {"surf"}}}}
mapLink["Route 27_B"] = {["Route 27 House1"] = {1}, ["Tohjo Falls"] = {1, {["abilities"] = {"surf"}}}, ["Route 26_A"] = {1.5, {["abilities"] = {"surf"}}}}
mapLink["Route 28 House"] = {["Route 28_B"] = {1}}
mapLink["Route 28_A"] = {["Pokemon League Reception Gate"] = {1}, ["Mt. Silver Exterior"] = {1}}
mapLink["Route 28_B"] = {["Mt. Silver Exterior"] = {1}, ["Route 28_A"] = {0.2}, ["Route 28 House"] = {1}}]]
mapLink["Route 2_A"] = {["Pewter City"] = {{24, 0, 27, 0}}, ["Route 2 Stop2"] = {{9, 42, 10, 42}}}
mapLink["Route 2_B"] = {["Route 2 House"] = {{36, 63}}, ["Digletts Cave Entrance 1"] = {{33, 31}}, ["Route 2 Stop3"] = {{39, 90, 40, 90}}}
mapLink["Route 2_C"] = {["Viridian City"] = {{7, 130, 10, 130}}, ["Route 2 Stop"] = {{15, 96, 16, 96}}}
mapLink["Route 2_D"] = {["Route 2 Stop3"] = {{39, 96, 40, 96}}}
mapLink["Route 3"] = {["Pewter City"] = {{0, 15, 0, 20}}, ["Mt. Moon 1F"] = {{84, 16}}, ["Pokecenter Route 3"] = {{79, 21}}}
mapLink["Route 4"] = {["Mt. Moon Exit"] = {{12, 14}}, ["Cerulean City_B"] = {{96, 13, 96, 17}}, ["Cerulean City_A"] = {{96, 20, 96, 22}}}
mapLink["Route 5 Stop House"] = {["Saffron City"] = {{3, 12, 4, 12}}, ["Route 5_B"] = {{3, 2, 4, 2}}}
mapLink["Route 5_A"] = {["Route 5_B"] = {{18, 0, 23, 0}}, ["Kanto Daycare"] = {{18, 14}}}
mapLink["Route 5_B"] = {["Cerulean City_A"] = {{12, 0, 14, 0}, {27, 0, 29, 0}}, ["Underground House 1"] = {{27, 29}}, ["Route 5 Stop House"] = {{21, 36, 22, 36}}}
mapLink["Route 6 Stop House"] = {["Saffron City"] = {{3, 2, 4, 2}}, ["Route 6"] = {{3, 12, 4, 12}}}
mapLink["Route 6"] = {["Vermilion City Graveyard"] = {{0, 51, 0, 53}}, ["Vermilion City_A"] = {{22, 61, 24, 61}}, ["Route 6 Stop House"] = {{26, 5, 27, 5}}, ["Underground House 2"] = {{36, 18}}}
mapLink["Route 7 Stop House"] = {["Route 7"] = {{0, 6, 0, 7}}, ["Saffron City"] = {{10, 6, 10, 7}}}
mapLink["Route 7"] = {["Route 7 Stop House"] = {{21, 24, 21, 25}}, ["Celadon City_A"] = {{0, 23, 0, 25}}, ["Underground House 3"] = {{10, 31}}}
mapLink["Route 8 Stop House"] = {["Route 8_A"] = {{10, 6, 10, 7}}, ["Saffron City"] = {{0, 6, 0, 7}}}
mapLink["Route 8_A"] = {["Lavender Town"] = {{72, 9, 72, 12}}, ["Route 8 Stop House"] = {{3, 12, 3, 13}}, ["Underground House 4"] = {{12, 9}}}
mapLink["Route 9"] = {["Route 10_B"] = {{91, 33, 94, 33}}, ["Route 10_A"] = {{85, 33, 88, 33}}, ["Cerulean City_A"] = {{0, 7, 0, 9}}}
mapLink["Safari Area 1"] = {["Safari Entrance_A"] = {{0, 34, 0, 35}}, ["Safari Area 2_A"] = {{0, 17, 0, 18}}, ["Safari House 2"] = {{40, 20}}}
mapLink["Safari Area 2_A"] = {["Safari Area 3"] = {{7, 44, 8, 44}, {14, 44, 15, 44}}, ["Safari Area 1"] = {{43, 35, 43, 36}}}
mapLink["Safari Area 2_B"] = {["Safari Area 3"] = {{7, 44, 8, 44}, {14, 44, 15, 44}}, ["Safari House 3"] = {{34, 11}}}
mapLink["Safari Area 3"] = {["Safari House 4"] = {{15, 17}}, ["SecretHouse"] = {{13, 7}}, ["Safari Area 2_A"] = {{27, 0, 28, 0}, {34, 0, 35, 0}}, ["Safari Entrance_B"] = {{42, 25, 42, 26}}}
mapLink["Safari Entrance_A"] = {["Kanto Safari Zone Area 1 Building 1"] = {{33, 21}}, ["Safari Stop"] = {{27, 26}}, ["Safari Area 1"] = {{55, 12, 55, 13}}}
mapLink["Safari Entrance_B"] = {["Safari Area 3"] = {{0, 15, 0, 16}}}
--mapLink["Safari Entrance_C"] = {["Safari Entrance_B"] = {0, {["abilities"] = {"surf"}}}, ["Safari Entrance_A"] = {0, {["abilities"] = {"surf"}}}}
--mapLink["Safari Exclusive"] = {["Safari Area 3"] = {1}}
mapLink["Safari House 2"] = {["Safari Area 1"] = {{11, 10, 12, 10}}}
mapLink["Safari House 3"] = {["Safari Area 2_B"] = {{7, 10, 8, 10}}}
mapLink["Safari House 4"] = {["Safari Area 3"] = {{10, 10, 11, 10}}}
mapLink["Safari Stop"] = {["Fuchsia City"] = {{6, 15, 7, 15}}}
--mapLink["Saffron City Station Floor 2"] = {["Saffron City Station_B"] = {0.5}, ["Trainers Valley Station Floor 2"] = {999}}
mapLink["Saffron City Station_A"] = {["Saffron City"] = {{9, 20}}}
mapLink["Saffron City Station_B"] = {["Saffron City Station Floor 2"] = {{1, 4}}}
mapLink["Saffron City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Cerulean City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Pokecenter Saffron"] = {{19, 12}}}
mapLink["Saffron City"] = {["Silph Co 1F"] = {{33, 34, 34, 34}}, ["Psychic House"] = {{46, 44}}, ["Guild House"] = {{50, 44}}, ["Saffron House Bottom"] = {{22, 25}}, ["Saffron Gym_H"] = {{49, 13}}, ["Saffron Dojo"] = {{42, 13}}, ["Route 7 Stop House"] = {{5, 38, 5, 39}}, ["Route 8 Stop House"] = {{60, 38, 60, 39}}, ["Route 5 Stop House"] = {{26, 5, 27, 5}}, ["Saffron Pokemart"] = {{43, 25}}, ["Saffron City Station_A"] = {{10, 15}}, ["Route 6 Stop House"] = {{26, 52, 27, 52}}, ["Pokecenter Saffron"] = {{19, 45}}, ["Golds Gym"] = {{39, 44}}}
mapLink["Saffron Dojo"] = {["Saffron City"] = {{6, 15, 7, 15}}}
mapLink["Saffron Gym_A"] = {["Saffron Gym_B"] = {{6, 3}}, ["Saffron Gym_C"] = {{2, 3}}, ["Saffron Gym_D"] = {{6, 6}}, ["Saffron Gym_E"] = {{2, 6}}}
mapLink["Saffron Gym_B"] = {["Saffron Gym_A"] = {{14, 3}}, ["Saffron Gym_D"] = {{10, 6}}, ["Saffron Gym_F"] = {{10, 3}}, ["Saffron Gym_G"] = {{14, 6}}}
mapLink["Saffron Gym_C"] = {["Saffron Gym_A"] = {{18, 6}}, ["Saffron Gym_F"] = {{18, 3}}, ["Saffron Gym_G"] = {{22, 6}}, ["Saffron Gym_I"] = {{22, 3}}}
mapLink["Saffron Gym_D"] = {["Saffron Gym_A"] = {{2, 13}}, ["Saffron Gym_B"] = {{6, 10}}, ["Saffron Gym_F"] = {{2, 10}}, ["Saffron Gym_G"] = {{6, 13}}}
mapLink["Saffron Gym_E"] = {["Saffron Gym_A"] = {{14, 13}}, ["Saffron Gym_H"] = {{10, 13}}}
mapLink["Saffron Gym_F"] = {["Saffron Gym_B"] = {{18, 13}}, ["Saffron Gym_C"] = {{18, 10}}, ["Saffron Gym_D"] = {{22, 13}}, ["Saffron Gym_I"] = {{22, 10}}}
mapLink["Saffron Gym_G"] = {["Saffron Gym_B"] = {{2, 20}}, ["Saffron Gym_C"] = {{2, 17}}, ["Saffron Gym_D"] = {{6, 20}}, ["Saffron Gym_I"] = {{6, 17}}}
mapLink["Saffron Gym_H"] = {["Saffron Gym_I"] = {{15, 17}}, ["Saffron City"] = {{12, 22}}}
mapLink["Saffron Gym_I"] = {["Saffron Gym_C"] = {{18, 17}}, ["Saffron Gym_F"] = {{22, 17}}, ["Saffron Gym_G"] = {{18, 20}}, ["Saffron Gym_H"] = {{22, 20}}}
mapLink["Saffron House Bottom"] = {["Saffron City"] = {{4, 10}}, ["Saffron House Top"] = {{14, 3}}}
mapLink["Saffron House Top"] = {["Saffron House Bottom"] = {{11, 3}}}
mapLink["Saffron Pokemart"] = {["Saffron City"] = {{4, 12, 5, 12}}}
mapLink["Seafoam 1F_A"] = {["Seafoam B1F"] = {{64, 8}}, ["Route 20_A"] = {{71, 15}}}
mapLink["Seafoam 1F_B"] = {["Route 20_B"] = {{13, 16}}, ["Seafoam B1F"] = {{20, 8}}}
mapLink["Seafoam B1F"] = {["Seafoam B2F_A"] = {{26, 22}}, ["Seafoam 1F_B"] = {{15, 12}}, ["Seafoam B2F_B"] = {{36, 21}}, ["Seafoam 1F_A"] = {{85, 22}}, ["Seafoam B2F_D"] = {{64, 25}}}
mapLink["Seafoam B2F_A"] = {["Seafoam B3F_A"] = {{12, 28}}, ["Seafoam B1F"] = {{19, 23}}}
mapLink["Seafoam B2F_B"] = {["Seafoam B1F"] = {{24, 23}}}
mapLink["Seafoam B2F_C"] = {["Seafoam B3F_D"] = {{35, 18}}, ["Seafoam B3F_C"] = {{63, 27}}}
mapLink["Seafoam B2F_D"] = {["Seafoam B3F_E"] = {{63, 19}}, ["Seafoam B1F"] = {{51, 27}}}
mapLink["Seafoam B3F_A"] = {["Seafoam B2F_A"] = {{10, 27}}, ["Seafoam B4F_A"] = {{12, 8}}}
mapLink["Seafoam B3F_B"] = {["Seafoam B2F_A"] = {{10, 27}}, ["Seafoam B4F_A"] = {{12, 8}}}
mapLink["Seafoam B3F_C"] = {["Seafoam B2F_C"] = {{61, 28}}, ["Seafoam B4F_A"] = {{66, 27}}}
mapLink["Seafoam B3F_D"] = {["Seafoam B4F_C"] = {{43, 15}}, ["Seafoam B2F_C"] = {{35, 19}}}
mapLink["Seafoam B3F_E"] = {["Seafoam B4F_B"] = {{49, 7}}, ["Seafoam B4F_D"] = {{57, 26}}, ["Seafoam B4F_C"] = {{20, 25}}, ["Seafoam B2F_D"] = {{64, 16}}}
mapLink["Seafoam B4F_A"] = {["Seafoam B3F_C"] = {{63, 27}}, ["Seafoam B3F_B"] = {{9, 6}}}
mapLink["Seafoam B4F_B"] = {["Seafoam B3F_E"] = {{46, 6}}}
mapLink["Seafoam B4F_C"] = {["Seafoam B3F_D"] = {{38, 16}}, ["Seafoam B3F_E"] = {{19, 23}}}
mapLink["Seafoam B4F_D"] = {["Seafoam B3F_E"] = {{53, 28}}}
mapLink["SecretHouse"] = {["Safari Area 3"] = {{6, 15, 7, 15}}}
mapLink["Silph Co 10F"] = {["Silph Co 4F"] = {1}, ["Silph Co 9F"] = {1}, ["Silph Co 11F_A"] = {1}, ["Silph Co Elevator"] = {1}}
mapLink["Silph Co 11F_A"] = {["Silph Co 10F"] = {1}, ["Silph Co Elevator"] = {1}}
mapLink["Silph Co 11F_B"] = {["Silph Co 7F_B"] = {1}}
mapLink["Silph Co 1F"] = {["Silph Co Elevator"] = {{19, 6}}, ["Silph Co 2F"] = {{30, 3}}, ["Saffron City"] = {{10, 28, 11, 28}}}
mapLink["Silph Co 2F"] = {["Silph Co 6F"] = {1}, ["Silph Co 8F"] = {1},  ["Silph Co 1F"] = {1}, ["Silph Co 3F"] = {1}, ["Silph Co Elevator"] = {1}}
mapLink["Silph Co 3F"] = {["Silph Co 9F"] = {1}, ["Silph Co 7F_B"] = {1}, ["Silph Co 5F"] = {1}, ["Silph Co 2F"] = {1}, ["Silph Co 4F"] = {1}, ["Silph Co Elevator"] = {1}}
mapLink["Silph Co 4F"] = {["Silph Co 6F"] = {1}, ["Silph Co 10F"] = {1}, ["Silph Co 3F"] = {1}, ["Silph Co 5F"] = {1}, ["Silph Co Elevator"] = {1}}
mapLink["Silph Co 5F"] = {["Silph Co 9F"] = {1}, ["Silph Co 3F"] = {1}, ["Silph Co 7F_A"] = {1}, ["Silph Co 4F"] = {1}, ["Silph Co 6F"] = {1}, ["Silph Co Elevator"] = {1}}
mapLink["Silph Co 6F"] = {["Silph Co 2F"] = {1}, ["Silph Co 4F"] = {1}, ["Silph Co 5F"] = {1}, ["Silph Co 7F_A"] = {1}, ["Silph Co Elevator"] = {1}}
mapLink["Silph Co 7F_A"] = {["Silph Co 5F"] = {1}, ["Silph Co 6F"] = {1}, ["Silph Co 8F"] = {1}, ["Silph Co Elevator"] = {1}}
mapLink["Silph Co 7F_B"] = {["Silph Co 11F_B"] = {1}, ["Silph Co 3F"] = {1}, }
mapLink["Silph Co 8F"] = {["Silph Co 2F"] = {1}, ["Silph Co 7F_A"] = {1}, ["Silph Co 9F"] = {1}, ["Silph Co Elevator"] = {1}}
mapLink["Silph Co 9F"] = {["Silph Co 5F"] = {1}, ["Silph Co 3F"] = {1}, ["Silph Co 8F"] = {1}, ["Silph Co 10F"] = {1}, ["Silph Co Elevator"] = {1}}
--mapLink["Silph Co Elevator"] = {["Silph Co 1F"] = {1}}
--[[mapLink["Tohjo Falls"] = {["Route 27_A"] = {1, {["abilities"] = {"surf"}}}, ["Route 27_B"] = {1, {["abilities"] = {"surf"}}}}
mapLink["Trainers Valley"] = {["Pokecenter Trainers Valley"] = {1}, ["Trainers Valley Station"] = {1}, ["Trainers Valley Stop"] = {1}}
mapLink["Trainers Valley Station"] = {["Trainers Valley"] = {1}, ["Trainers Valley Station Floor 2"] = {1}}
mapLink["Trainers Valley Station Floor 2"] = {["Trainers Valley Station"] = {0.5}, ["Saffron City Station Floor 2"] = {0.5}, ["Goldenrod City Station Floor 2"] = {0.5}}
mapLink["Trainers Valley Stop"] = {["Trainers Valley Stop"] = {1]]
mapLink["Underground House 1"] = {["Underground2"] = {{9, 3}}, ["Route 5_B"] = {{4, 10, 5, 10}}}
mapLink["Underground House 2"] = {["Underground2"] = {{9, 3}}, ["Route 6"] = {{4, 10, 5, 10}}}
mapLink["Underground House 3"] = {["Route 7"] = {{4, 10, 5, 10}}, ["Underground1"] = {{9, 3}}}
mapLink["Underground House 4"] = {["Route 8_A"] = {{4, 10, 5, 10}}, ["Underground1"] = {{1, 3}}}
mapLink["Underground1"] = {["Underground House 4"] = {{69, 5}}, ["Underground House 3"] = {{1, 5}}}
mapLink["Underground2"] = {["Underground House 2"] = {{3, 43, 3, 44}}, ["Underground House 1"] = {{3, 2, 3, 3}}}
mapLink["Vermilion City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Pokecenter Vermilion"] = {{19, 12}}, ["Cerulean City Subway"] = {K_SUBWAY}}
mapLink["Vermilion City_B"] = {["Vermilion Gym"] = {{26, 51}}, ["Vermilion City_A"] = {{33, 48}}}
mapLink["Vermilion City_A"] = {["Pokemon Club"] = {{23, 38}}, ["Vermilion House E"] = {{48, 49}}, ["Vermilion House D"] = {{47, 20}}, ["Vermilion House C"] = {{42, 21}}, ["Vermilion House B"] = {{69, 20}}, ["Vermilion House A"] = {{64, 20}}, ["VermilionHouse2Bottom"] = {{32, 21}}, ["Vermilion House 1"] = {{21, 20}}, ["Fisherman House - Vermilion"] = {{30, 37}}, ["Vermilion Pokemart"] = {{47, 37}}, ["Route 11"] = {{82, 39, 82, 42}}, ["Pokecenter Vermilion"] = {{27, 21}}, ["Route 6"] = {{41, 0, 43, 0}}}
mapLink["Vermilion City Graveyard"] = {["Route 6"] = {{60, 31, 60, 33}}}
mapLink["Vermilion Gym"] = {["Vermilion City_B"] = {{6, 21}}}
mapLink["Vermilion House 1"] = {["Vermilion City_A"] = {{4, 10, 5, 10}}}
mapLink["Vermilion House A"] = {["Vermilion City_A"] = {{5, 10}}}
mapLink["Vermilion House B"] = {["Vermilion City_A"] = {{3, 10}}}
mapLink["Vermilion House C"] = {["Vermilion City_A"] = {{5, 10}}}
mapLink["Vermilion House D Top"] = {["Vermilion House D"] = {{9, 3}}}
mapLink["Vermilion House D"] = {["Vermilion City_A"] = {{5, 10}}, ["Vermilion House D Top"] = {{9, 3}}}
mapLink["Vermilion House E"] = {["Vermilion City_A"] = {{5, 10}}}
mapLink["Vermilion Pokemart"] = {["Vermilion City_A"] = {{6, 12, 7, 12}}}
mapLink["VermilionHouse2Bottom"] = {["Vermilion City_A"] = {{5, 10}}, ["VermilionHouse2Top"] = {{9, 3}}}
mapLink["VermilionHouse2Top"] = {["VermilionHouse2Bottom"] = {{9, 2}}}
mapLink["Victory Road Kanto 1F"] = {["Victory Road Kanto 2F_A"] = {{17, 11}}, ["Pokemon League Reception Gate"] = {{43, 52}}}
mapLink["Victory Road Kanto 2F_A"] = {["Victory Road Kanto 3F_D"] = {{57, 25}}, ["Victory Road Kanto 3F_A"] = {{14, 9}}, ["Victory Road Kanto 1F"] = {{14, 20}}}
mapLink["Victory Road Kanto 2F_B"] = {["Victory Road Kanto 2F_C"] = {{33, 28, 38, 28}}}
mapLink["Victory Road Kanto 2F_C"] = {["Victory Road Kanto 3F_B"] = {{33, 29}}}
mapLink["Victory Road Kanto 2F_D"] = {["Victory Road Kanto 2F_A"] = {{56, 29, 56, 31}}, ["Victory Road Kanto 3F_C"] = {{62, 11}}}
mapLink["Victory Road Kanto 3F_A"] = {["Indigo Plateau"] = {{46, 13}}, ["Victory Road Kanto 2F_C"] = {{34, 37}}, ["Victory Road Kanto 2F_A"] = {{14, 17}}, ["Victory Road Kanto 3F_B"] = {{28, 21, 28, 22}}}
mapLink["Victory Road Kanto 3F_B"] = {["Victory Road Kanto 2F_A"] = {{29, 17}}, ["Indigo Plateau"] = {{46, 13}}, ["Victory Road Kanto 2F_C"] = {{34, 37}}}
mapLink["Victory Road Kanto 3F_C"] = {["Victory Road Kanto 2F_C"] = {{38, 37}}, ["Victory Road Kanto 2F_D"] = {{62, 24}}, ["Victory Road Kanto 2F_B"] = {{35, 33}}}
mapLink["Victory Road Kanto 3F_D"] = {["Victory Road Kanto 2F_A"] = {{56, 32}}, ["Victory Road Kanto 2F_D"] = {{61, 35}}}
mapLink["Viridian City House 1"] = {["Viridian City"] = {{4, 9}}}
mapLink["Viridian City House 2"] = {["Viridian City"] = {{4, 9}}}
mapLink["Viridian City School Underground"] = {["Viridian City School"] = {{13, 3}}}
mapLink["Viridian City School"] = {["Viridian City"] = {{4, 13}}, ["Viridian City School Underground"] = {{12, 3}}}
mapLink["Viridian City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Cerulean City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Pokecenter Viridian"] = {{19, 12}}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}}
mapLink["Viridian City"] = {["Viridian Gym 2"] = {{60, 22}}, ["Viridian City House 1"] = {{48, 27}}, ["Viridian City House 2"] = {{48, 18}}, ["Viridian City School"] = {{48, 34}}, ["Route 1 Stop House"] = {{48, 61, 49, 61}}, ["Pokecenter Viridian"] = {{44, 43}}, ["Viridian Pokemart"] = {{54, 34}}, ["Route 2_C"] = {{37, 0, 40, 0}}, ["Route 22"] = {{0, 47, 0, 49}}}
mapLink["Viridian Forest"] = {["Viridian Maze"] = {{19, 38}}, ["Route 2 Stop"] = {{40, 70, 41, 70}}, ["Route 2 Stop2"] = {{11, 15, 12, 15}}}
mapLink["Viridian Gym 2"] = {["Viridian City"] = {{10, 32}}}
mapLink["Viridian Maze"] = {["Viridian Forest"] = {{16, 60}}}
mapLink["Viridian Pokemart"] = {["Viridian City"] = {{4, 11}}}



-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- Johto --------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

--mapLink["Area Name"] = {
--	["Link Area Name"] = {{X, Y}},
--	["Link Area Name"] = {{minX, minY, maxX, maxY}},
--}

-- New Bark Town
mapLink["New Bark Town"] = {["Route 29"] = {{0, 16, 0, 19}}, ["Route 27_A"] = {{47, 18, 47, 21}}}

-- Route 29
mapLink["Route 29"] = {["Cherrygrove City_A"] = {{0, 15, 0, 18}}, ["New Bark Town"] = {{99, 14, 99, 19}}, ["Route 29 Stop House"] = {{52, 7, 53, 7}}}
mapLink["Route 29 Stop House"] = {["Route 29"] = {{3, 12, 4, 12}}, ["Route 46_B"] = {{3, 2, 4, 2}}}

-- Cherrygrove City
mapLink["Cherrygrove City_A"] = {["Mart Cherrygrove City"] = {{41, 6}}, ["Pokecenter Cherrygrove City"] = {{51, 6}}, ["Route 29"] = {{63, 14, 63, 17}}, ["Route 30"] = {{35, 0, 37, 0}}}
mapLink["Cherrygrove City_B"] = {["Route 30"] = {{53, 0, 62, 0}}}
mapLink["Mart Cherrygrove City"] = {["Cherrygrove City_A"] = {{4, 11}}}
mapLink["Pokecenter Cherrygrove City"] = {["Cherrygrove City_A"] = {{10, 20, 11, 20}}, ["Cherrygrove City Subway"] = {{3, 14}}}
mapLink["Cherrygrove City Subway"] = {["Pokecenter Cherrygrove City"] = {{19, 12}}, ["Olivine City Subway"] = {K_SUBWAY}, ["Violet City Subway"] = {K_SUBWAY}, ["Azalea Town Subway"] = {K_SUBWAY}, ["Blackthorn City Subway"] = {K_SUBWAY}, ["Mahogany Town Subway"] = {K_SUBWAY}, ["Ecruteak City Subway"] = {K_SUBWAY}, ["Goldenrod City Subway"] = {K_SUBWAY}}

-- Route 30
mapLink["Route 30"] = {["Cherrygrove City_A"] = {{7, 96, 9, 96}}, ["Cherrygrove City_B"] = {{25, 96, 34, 96}}, ["Route 31"] = {{10, 0, 13, 0}}}

-- Route 31
mapLink["Route 31"] = {["Dark Cave South_A"] = {{50, 10}}, ["Route 30"] = {{37, 30, 40, 30}}, ["Violet City Stop House"] = {{4, 14, 4, 15}}}

-- Dark Cave
mapLink["Dark Cave North_A"] = {["Route 45_A"] = {{71, 17}}}
mapLink["Dark Cave North_B"] = {["Dark Cave South_B"] = {{16, 62}}}
mapLink["Dark Cave South_A"] = {["Route 31"] = {{15, 35}}}
mapLink["Dark Cave South_B"] = {["Dark Cave North_B"] = {{35, 15}}}
mapLink["Dark Cave South_D"] = {["Route 46_A"] = {{63, 60}}}

-- Violet City
mapLink["Violet City Stop House"] = {["Route 31"] = {{10, 6, 10, 7}}, ["Violet City"] = {{0, 6, 0, 7}}}
mapLink["Violet City"] = {["Pokecenter Violet City"] = {{48, 57}}, ["Violet City Stop House"] = {{61, 55, 61, 66}}, ["Violet City Pokemart"] = {{18,41}}, ["Route 32"] = {{19, 72, 20, 72}}, ["Route 36 Stop"] = {{1, 31, 1, 32}}}
mapLink["Violet City Subway"] = {["Pokecenter Violet City"] = {{19, 12}}, ["Olivine City Subway"] = {K_SUBWAY}, ["Mahogany Town Subway"] = {K_SUBWAY}, ["Azalea Town Subway"] = {K_SUBWAY}, ["Blackthorn City Subway"] = {K_SUBWAY}, ["Cherrygrove City Subway"] = {K_SUBWAY}, ["Ecruteak City Subway"] = {K_SUBWAY}, ["Goldenrod City Subway"] = {K_SUBWAY}}
mapLink["Pokecenter Violet City"] = {["Violet City"] = {{8,22,9,22}}, ["Violet City Subway"] = {{2, 20}}}
mapLink["Violet City Pokemart"] = {["Violet City"] = {{6,12,7,12}}}

-- Route 32
mapLink["Route 32"] = {["Pokecenter Route 32"] = {{19, 128}}, ["Ruins Of Alph Stop House"] = {{6, 11, 6, 12}}, ["Union Cave 1F_C"] = {{13, 137}}, ["Violet City"] = {{22, 0, 24, 0}}}
mapLink["Pokecenter Route 32"] = {["Route 32"] = {{8, 22, 9, 22}}}

-- Ruins Of Alph
mapLink["Ruins Of Alph Stop House"] = {["Route 32"] = {{10, 6, 10, 7}}, ["Ruins Of Alph_A"] = {{0, 6, 0, 7}}}
mapLink["Ruins Of Alph Stop House 1"] = {["Route 36"] = {{3, 2, 4, 2}}, ["Ruins Of Alph_A"] = {{3, 12, 4, 12}}}
mapLink["Ruins Of Alph_A"] = {["Ruins Of Alph Stop House"] = {{42, 34, 42, 35}}, ["Ruins Of Alph Stop House 1"] = {{23, 5, 24, 5}}, ["Ruins Research Center"] = {{35, 28}}}
mapLink["Ruins Of Alph_B"] = {["Union Cave 1F_B"] = {{10, 30}}}
mapLink["Ruins Of Alph_C"] = {["Union Cave 1F_A"] = {{10, 47}}}
mapLink["Ruins Research Center"] = {["Ruins Of Alph_A"] = {{3, 11}}}

-- Union Cave
mapLink["Union Cave 1F_A"] = {["Union Cave B2F_A"] = {{23, 16}}, ["Ruins Of Alph_C"] = {{19, 18}}}
mapLink["Union Cave 1F_B"] = {["Union Cave B2F_B"] = {{43, 16}}, ["Ruins Of Alph_B"] = {{40, 19}}}
mapLink["Union Cave 1F_C"] = {["Union Cave 1F_D"] = {2.5}, ["Route 32"] = {{43, 47}}, ["Route 33"] = {{42, 84}}, ["Union Cave B1F_A"] = {{19, 31}}}
mapLink["Union Cave 1F_D"] = {["Union Cave 1F_C"] = {0}, ["Union Cave B1F_C"] = {{23, 82}}}
mapLink["Union Cave B1F_A"] = {["Union Cave 1F_C"] = {{43, 48}}, ["Union Cave B1F_B"] = {0.5}}
mapLink["Union Cave B1F_B"] = {["Union Cave B2F_A"] = {{16, 24}}, ["Union Cave B2F_B"] = {{16, 16}}}
mapLink["Union Cave B1F_C"] = {["Union Cave 1F_D"] = {{15, 62}}, ["Union Cave B2F_C"] = {{43, 59}}}
mapLink["Union Cave B2F_A"] = {["Union Cave 1F_A"] = {{18, 20}}, ["Union Cave B1F_B"] = {{27, 28}}}
mapLink["Union Cave B2F_B"] = {["Union Cave 1F_B"] = {{39, 18}}, ["Union Cave B1F_B"] = {{46, 28}}}
mapLink["Union Cave B2F_C"] = {["Union Cave B1F_C"] = {{19, 43}}}

-- Route 33
mapLink["Route 33"] = {["Azalea Town"] = {{0, 20, 0, 23}}, ["Union Cave 1F_C"] = {{21, 13}}}

-- Azalea Town
mapLink["Azalea Town Subway"] = {["Pokecenter Azalea"] = {{19, 12}}, ["Olivine City Subway"] = {K_SUBWAY}, ["Violet City Subway"] = {K_SUBWAY}, ["Mahogany Town Subway"] = {K_SUBWAY}, ["Blackthorn City Subway"] = {K_SUBWAY}, ["Cherrygrove City Subway"] = {K_SUBWAY}, ["Ecruteak City Subway"] = {K_SUBWAY}, ["Goldenrod City Subway"] = {K_SUBWAY}}
mapLink["Azalea Town"] = {["Azalea Pokemart"] = {{34, 13}}, ["Ilex Forest Stop House"] = {{4, 12, 4, 13}}, ["Pokecenter Azalea"] = {{25, 14}}, ["Route 33"] = {{60, 26, 60, 29}}, ["Slowpoke Well"] = {{46, 10}}}
mapLink["Pokecenter Azalea"] = {["Azalea Town"] = {{10, 20, 11, 20}}, ["Azalea Town Subway"] = {{3, 14}}}
mapLink["Azalea Pokemart"] = {["Azalea Town"] = {{6, 12, 7, 12}}}

-- Slowpoke Well
mapLink["Slowpoke Well L1"] = {["Slowpoke Well"] = {{16, 18}}}
mapLink["Slowpoke Well"] = {["Azalea Town"] = {{41, 39}}, ["Slowpoke Well L1"] = {{35, 27}}}

-- Ilex Forest
mapLink["Ilex Forest Stop House"] = {["Azalea Town"] = {{10, 6, 10, 7}}, ["Ilex Forest_A"] = {{0, 6, 0, 7}}}
mapLink["Ilex Forest_A"] = {["Ilex Forest Stop House"] = {{10, 74, 10, 75}}}
mapLink["Ilex Forest_B"] = {["Ilex Forest_A"] = {2}, ["Route 34 Stop House"] = {{7, 7, 8, 7}}}

-- Route 34
mapLink["Route 34 Stop House"] = {["Ilex Forest_B"] = {{3, 12, 4, 12}}, ["Route 34_A"] = {{3, 2, 4, 2}}}
mapLink["Route 34_A"] = {["Goldenrod City"] = {{8, 0, 13, 0}}, ["Route 34 Stop House"] = {{24, 64, 25, 64}}}

-- Goldenrod City
mapLink["Goldenrod City Subway"] = {["Pokecenter Goldenrod"] = {{19, 12}}, ["Olivine City Subway"] = {K_SUBWAY}, ["Violet City Subway"] = {K_SUBWAY}, ["Azalea Town Subway"] = {K_SUBWAY}, ["Blackthorn City Subway"] = {K_SUBWAY}, ["Cherrygrove City Subway"] = {K_SUBWAY}, ["Ecruteak City Subway"] = {K_SUBWAY}, ["Mahogany Town Subway"] = {K_SUBWAY}}
mapLink["Goldenrod City"] = {["Goldenrod Mart 1"] = {{75, 47, 76, 47}}, ["Pokecenter Goldenrod"] = {{64, 47}}, ["Route 34_A"] = {{66, 62, 71, 62}}, ["Route 35 Stop House"] = {{68, 11, 69, 11}}, ["Goldenrod City Game Corner"] = {{62, 40}}}
mapLink["Pokecenter Goldenrod"] = {["Goldenrod City"] = {{10, 20, 11, 20}}, ["Goldenrod City Subway"] = {{3, 16}}}
mapLink["Goldenrod City Game Corner"] = {["Goldenrod City"] = {{5, 25, 6, 25}}}

-- Route 35
mapLink["Route 35 Stop House"] = {["Goldenrod City"] = {{3, 12, 4, 12}}, ["Route 35_A"] = {{3, 2, 4, 2}}}
mapLink["Route 35_A"] = {["National Park Stop House 1"] = {{10, 6, 11, 6}}, ["Route 35 Stop House"] = {{4, 58, 5, 58}}}
mapLink["Route 35_B"] = {["Route 36"] = {{27, 0, 28, 0}}}

-- National Park Stop
mapLink["National Park Stop House 1"] = {["National Park"] = {{3, 2, 4, 2}}, ["Route 35_A"] = {{3, 12, 4, 12}}, --[[["Bug Catching Contest Hall"] = {{11, 4, 11, 5}}]]}
--mapLink["Bug Catching Contest Hall"] = {["National Park Stop House 1"] = {{14, 21, 14, 22}}}
mapLink["National Park"] = {["National Park Stop"] = {{62, 31, 62, 32}}, ["National Park Stop House 1"] = {{26, 76, 27, 76}}}
mapLink["National Park Stop"] = {["National Park"] = {{0, 6, 0, 7}}, ["Route 36"] = {{10, 6, 10, 7}}}

-- Route 36
mapLink["Route 36 Stop"] = {["Route 36"] = {{0, 6, 0, 7}}, ["Violet City"] = {{10, 6, 10, 7}}}
mapLink["Route 36"] = {["Route 35_B"] = {{7, 37, 8, 37}}, ["Route 36 Stop"] = {{77, 23, 77, 24}}, ["Route 37"] = {{17, 0, 19, 0}}, ["Ruins Of Alph Stop House 1"] = {{62, 29, 63, 29}}, ["National Park Stop"] = {{2, 18, 2, 19}}}

-- Route 37
mapLink["Route 37"] = {["Ecruteak City"] = {{17, 4, 18, 4}}, ["Route 36"] = {{14, 37, 17, 37}}}

-- Ecruteak City
mapLink["Ecruteak City Subway"] = {["Pokecenter Ecruteak"] = {{19, 12}}, ["Olivine City Subway"] = {K_SUBWAY}, ["Violet City Subway"] = {K_SUBWAY}, ["Azalea Town Subway"] = {K_SUBWAY}, ["Blackthorn City Subway"] = {K_SUBWAY}, ["Cherrygrove City Subway"] = {K_SUBWAY}, ["Mahogany Town Subway"] = {K_SUBWAY}, ["Goldenrod City Subway"] = {K_SUBWAY}}
mapLink["Ecruteak City"] = {["Ecruteak Mart"] = {{52, 31}}, ["Ecruteak Stop House 1"] = {{3, 25, 3, 26}}, ["Ecruteak Stop House 2"] = {{62, 33, 62, 34}}, ["Pokecenter Ecruteak"] = {{43, 39}}, ["Route 37"] = {{37, 47, 38, 47}}, ["Burned Tower Top Floor"] = {{22, 9}}}
mapLink["Ecruteak Mart"] = {["Ecruteak City"] = {{4, 11}}}
mapLink["Ecruteak Stop House 1"] = {["Ecruteak City"] = {{10, 6, 10, 7}}, ["Route 38"] = {{0, 6, 0, 7}}}
mapLink["Ecruteak Stop House 2"] = {["Ecruteak City"] = {{0, 6, 0, 7}}, ["Route 42_A"] = {{10, 6, 10, 7}}}
mapLink["Pokecenter Ecruteak"] = {["Ecruteak City"] = {{10, 20, 11, 20}}, ["Ecruteak City Subway"] = {{3, 16}}}

-- Burned Tower
mapLink["Burned Tower Floor 2"] = {["Burned Tower Top Floor"] = {{18, 10}}}
mapLink["Burned Tower Top Floor"] = {["Ecruteak City"] = {{10, 18, 11, 18}}, ["Burned Tower Floor 2"] = {{18, 11}}}

-- Route 38
mapLink["Route 38"] = {["Ecruteak Stop House 1"] = {{63, 11, 63, 12}}, ["Route 39"] = {{0, 15, 0, 16}}}

-- Route 39
mapLink["Route 39"] = {["Olivine City"] = {{28, 65, 30, 65}}, ["Route 38"] = {{39, 16, 39, 17}}}

-- Olivine City
mapLink["Olivine Pokecenter"] = {["Olivine City Subway"] = {{3, 14}}, ["Olivine City"] = {{10, 20, 11, 20}}}
mapLink["Olivine City Subway"] = {["Olivine Pokecenter"] = {{19, 12}}, ["Mahogany Town Subway"] = {K_SUBWAY}, ["Violet City Subway"] = {K_SUBWAY}, ["Azalea Town Subway"] = {K_SUBWAY}, ["Blackthorn City Subway"] = {K_SUBWAY}, ["Cherrygrove City Subway"] = {K_SUBWAY}, ["Ecruteak City Subway"] = {K_SUBWAY}, ["Goldenrod City Subway"] = {K_SUBWAY}}
mapLink["Olivine City"] = {["Olivine Pokecenter"] = {{13, 32}}, ["Olivine Pokemart"] = {{27, 31}}, ["Route 39"] = {{20, 0, 22, 0}}, ["Route 40"] = {{0, 34, 0, 36}}}
mapLink["Olivine Pokemart"] = {["Olivine City"] = {{6, 12, 7, 12}}}

-- Route 40
mapLink["Route 40"] = {["Olivine City"] = {{30, 5, 30, 7}}, ["Route 41"] = {{3, 47, 22, 47}}}

-- Route 41
mapLink["Route 41"] = {["Cianwood City"] = {{0, 8, 0, 51}}, ["Route 40"] = {{43, 0, 60, 0}}, ["Whirl Islands 1F NorthEast_A"] = {2}, ["Whirl Islands 1F NorthWest"] = {{14, 21}}, ["Whirl Islands 1F SouthWest"] = {{17, 42}}, ["Whirl Islands 1F SouthEast"]= {{46, 42}}, ["Route 49"] = {{54, 60, 56, 60}}}

-- Whirl Islands
mapLink["Whirl Islands 1F NorthEast_A"] = {["Route 41"] = {{13, 23}}}
mapLink["Whirl Islands 1F NorthEast_C"] = {["Whirl Islands B1F_A"] = {{24, 18}}}
mapLink["Whirl Islands 1F NorthEast_D"] = {["Whirl Islands B1F_C"] = {{27, 13}}}
mapLink["Whirl Islands 1F NorthWest"] = {["Route 41"] = {{16, 21}}, ["Whirl Islands B1F_A"] ={{13, 13}}}
mapLink["Whirl Islands 1F SouthEast"] = {["Route 41"] = {{18, 25}}, ["Whirl Islands B1F_B"] = {{18, 17}}}
mapLink["Whirl Islands 1F SouthWest"] = {["Route 41"] = {{16, 19}}, ["Whirl Islands B1F_B"] = {{13, 13}}}
mapLink["Whirl Islands B1F_A"] = {["Whirl Islands 1F NorthWest"] = {{18, 14}}, ["Whirl Islands 1F NorthEast_C"] = {{57, 22}}, ["Whirl Islands B2F"] = {{28, 56}}}
mapLink["Whirl Islands B1F_B"] = {["Whirl Islands 1F SouthWest"] = {{26, 60}}, ["Whirl Islands 1F SouthEast"] = {{61, 55}}}
mapLink["Whirl Islands B1F_C"] = {["Whirl Islands 1F NorthEast_D"] = {{65, 12}}, ["Whirl Islands B2F"] = {{50, 51}}}
mapLink["Whirl Islands B2F"] = {["Whirl Islands B1F_A"] = {{19, 25}}, ["Whirl Islands B1F_C"] = {{24, 13}}, ["Whirl Islands B3F"] = {{22, 30}},  ["Whirl Islands B4F"] = {{29, 55}}}
mapLink["Whirl Islands B3F"] = {["Whirl Islands B2F"] = {{22, 24}}}
mapLink["Whirl Islands B4F"] = {["Whirl Islands B2F"] = {{23, 36}}}

-- Cianwood City
mapLink["Pokecenter Cianwood"] = {["Cianwood City"] = {{10, 20, 11, 20}}}
mapLink["Cianwood City"] = {["Cianwood Shop"] = {{15, 48}}, ["Cliff Edge Gate"] = {{7, 29}}, ["Pokecenter Cianwood"] = {{24, 47}}, ["Route 41"] = {{31, 9, 31, 51}}}
mapLink["Cianwood Shop"] = {["Cianwood City"] = {{7, 10, 8, 10}}}

-- Cliff Edge Gate
mapLink["Cliff Edge Gate"] = {["Cianwood City"] = {{35, 23}}, ["Route 47_A"] = {{13, 38}}}

-- Route 47
mapLink["Route 47_A"] = {["Cliff Cave 1F"] = {{68, 71}}, ["Cliff Edge Gate"] = {{89, 74}}}
mapLink["Route 47_B"] = {["Cliff Cave B1F"] = {{67, 83}}}
mapLink["Route 47_C"] = {["Cliff Cave 2F"] = {{69, 65}}, ["Route 48"] = {{31, 0, 33, 0}}}

-- Cliff Cave
mapLink["Cliff Cave 1F"] = {["Cliff Cave 2F"] = {{14, 13}}, ["Cliff Cave B1F"] = {{21, 15}}, ["Route 47_A"] = {{17, 18}}}
mapLink["Cliff Cave 2F"] = {["Cliff Cave 1F"] = {{13, 13}}, ["Route 47_C"] = {{18, 22}}}
mapLink["Cliff Cave B1F"] = {["Cliff Cave 1F"] = {{15, 13}}, ["Route 47_B"] = {{14, 21}}}

-- Route 48
mapLink["Route 48"] = {["Johto Safari Zone Lobby"] = {{21, 6, 22, 6}}, ["Pokecenter Route 48"] = {{15, 15}}, ["Route 47_C"] = {{36, 72, 38, 72}}}
mapLink["Johto Safari Zone Lobby"] = {["Route 48"] = {{4, 15, 5, 15}}}
mapLink["Pokecenter Route 48"] = {["Route 48"] = {{10, 20, 11, 20}}}

-- Route 49
mapLink["Route 49"] = {["Route 41"] = {{30, 0, 32, 0}}, ["Nap Shore"] = {{30, 50, 33, 50}}}

-- Route 42
mapLink["Route 42_A"] = {["Ecruteak Stop House 2"] = {{3, 18, 3, 19}}, ["Mt. Mortar 1F_A"] = {{17, 13}}}
mapLink["Route 42_B"] = {["Mt. Mortar 1F_B"] = {{46, 17}}}
mapLink["Route 42_C"] = {["Mt. Mortar 1F_D"] = {{48, 6}}}
mapLink["Route 42_D"] = {["Mahogany Town"] = {{95, 15, 95, 18}}, ["Mt. Mortar 1F_C"] = {{75, 13}}}

-- Mt. Mortar
mapLink["Mt. Mortar 1F_A"] = {["Mt. Mortar Lower Cave"] = {{34, 35}}, ["Route 42_A"] = {{22, 46}}}
mapLink["Mt. Mortar 1F_B"] = {["Mt. Mortar B1F_A"] = {{43, 43}}, ["Route 42_B"] = {{43, 49}}}
mapLink["Mt. Mortar 1F_C"] = {["Mt. Mortar Lower Cave"] = {{53, 35}}, ["Route 42_D"] = {{65, 46}}}
mapLink["Mt. Mortar 1F_D"] = {["Mt. Mortar Lower Cave"] = {{74, 34}}, ["Route 42_C"] = {{56, 52}}}
mapLink["Mt. Mortar 1F_E"] = {["Mt. Mortar Lower Cave"] = {{26, 21}}}
mapLink["Mt. Mortar 1F_F"] = {["Mt. Mortar Upper Cave"] = {{43, 13}}}
mapLink["Mt. Mortar 1F_G"] = {["Mt. Mortar Lower Cave"] = {{65, 21}}}
mapLink["Mt. Mortar B1F_A"] = {["Mt. Mortar 1F_B"] = {{39, 54}}}
mapLink["Mt. Mortar B1F_B"] = {["Mt. Mortar Lower Cave"] = {{29, 13}}}
mapLink["Mt. Mortar Lower Cave"] = {["Mt. Mortar 1F_C"] = {{47, 57}}, ["Mt. Mortar 1F_A"] = {{26, 57}}, ["Mt. Mortar 1F_E"] = {{17, 45}}, ["Mt. Mortar 1F_G"] = {{56, 46}}, ["Mt. Mortar 1F_D"] = {{65, 58}}, ["Mt. Mortar B1F_B"] = {{25, 31}}, ["Mt. Mortar Upper Cave"] = {{18, 13}}}
mapLink["Mt. Mortar Upper Cave"] = {["Mt. Mortar Lower Cave"] = {{16, 17}}, ["Mt. Mortar 1F_F"] = {{33, 52}}, ["Mt. Mortar Northern Entrance"] = {{40, 11}}}
mapLink["Mt. Mortar Northern Entrance"] = {["Mt. Mortar Upper Cave"] = {{15, 53}}, ["Forest Pit"] = {{57, 17}}}

-- Forest Pit
mapLink["Forest Pit"] = {["Mt. Mortar Northern Entrance"] = {{26, 31}}, ["Lake Cave"] = {{30, 17}}}

-- Lake Cave
mapLink["Lake Cave"] = {["Forest Pit"] = {{21, 19}}, ["Item Recyclers Room"] = {{28, 3}}}
mapLink["Item Recyclers Room"] = {["Lake Cave"] = {{10, 11}}}

-- Mahogany Town
mapLink["Mahogany Town Subway"] = {["Pokecenter Mahogany"] = {{19, 12}}, ["Olivine City Subway"] = {K_SUBWAY}, ["Violet City Subway"] = {K_SUBWAY}, ["Azalea Town Subway"] = {K_SUBWAY}, ["Blackthorn City Subway"] = {K_SUBWAY}, ["Cherrygrove City Subway"] = {K_SUBWAY}, ["Ecruteak City Subway"] = {K_SUBWAY}, ["Goldenrod City Subway"] = {K_SUBWAY}}
mapLink["Mahogany Town"] = {["Mahogany Town Shop"] = {{16, 14}}, ["Pokecenter Mahogany"] = {{25, 23}}, ["Route 42_D"] = {{0, 14, 0, 17}}, ["Route 43"] = {{11, 5, 12, 5}}, ["Route 44"] = {{40, 15, 40, 17}}}
mapLink["Pokecenter Mahogany"] = {["Mahogany Town"] = {{8, 22, 9, 22}}, ["Mahogany Town Subway"] = {{2, 20}}}
mapLink["Mahogany Town Shop"] = {["Mahogany Town"] = {{3, 9}}}
mapLink["Route 43"] = {["Lake of Rage_A"] = {{20, 0, 23, 0}}, ["Lake of Rage_B"] = {{6, 0, 7, 0}}, ["Mahogany Town"] = {{15, 64, 18, 64}}}
mapLink["Lake of Rage_A"] = {["Lake of Rage House 1"] = {1}, ["Route 43"] = {{44, 60, 47, 60}}, ["Lake of Rage_C"] = {{69, 22}}}
mapLink["Lake of Rage_B"] = {["Route 43"] = {{27, 60, 28, 60}}, ["Lake of Rage_E"] = {{33, 15}}}


-- Route 43
mapLink["Route 43"] = {["Lake of Rage_A"] = {{20, 0, 23, 0}}, ["Lake of Rage_B"] = {{6, 0, 7, 0}}, ["Mahogany Town"] = {{15, 64, 18, 64}}}

-- Lake of Rage
mapLink["Lake of Rage_A"] = {["Route 43"] = {{44, 60, 47, 60}}}
mapLink["Lake of Rage_B"] = {["Route 43"] = {{27, 60, 28, 60}}}
mapLink["Lake of Rage_E"] = {["Secluded Lake"] = {{32, 0, 33, 0}}}
mapLink["Secluded Lake"] = {["Lake of Rage_E"] = {{17, 28, 18, 28}}}

-- Route 44
mapLink["Route 44"] = {["Ice Path 1F_A"] = {{81, 9}}, ["Mahogany Town"] = {{0, 14, 0, 16}}}

-- Ice Path
mapLink["Ice Path 1F_A"] = {["Route 44"] = {{12, 62}}, ["Ice Path B1F_A"] = {{57, 15}}}
mapLink["Ice Path 1F_B"] = {["Blackthorn City"] = {{57, 46}}, ["Ice Path B1F_B"] = {{57, 28}}}
mapLink["Ice Path B1F_A"] = {["Ice Path B2F_A"] = {{21, 25}}, ["Ice Path 1F_A"] = {{16, 28}}}
mapLink["Ice Path B1F_B"] = {["Ice Path B2F_B"] = {{40, 42}}, ["Ice Path 1F_B"] = {{18, 44}}}
mapLink["Ice Path B2F_A"] = {["Ice Path B3F"] = {{23, 22}}, ["Ice Path B1F_A"] = {{33, 17}}}
mapLink["Ice Path B2F_B"] = {["Ice Path B3F"] = {{57, 11}}, ["Ice Path B1F_B"] = {{50, 27}}}
mapLink["Ice Path B3F"] = {["Ice Path B2F_A"] = {{13, 16}}, ["Ice Path B2F_B"] = {{32, 17}}}

-- Blackthorn City
mapLink["Blackthorn City Subway"] = {["Pokecenter Blackthorn"] = {{19, 12}}, ["Olivine City Subway"] = {K_SUBWAY}, ["Violet City Subway"] = {K_SUBWAY}, ["Azalea Town Subway"] = {K_SUBWAY}, ["Mahogany Town Subway"] = {K_SUBWAY}, ["Cherrygrove City Subway"] = {K_SUBWAY}, ["Ecruteak City Subway"] = {K_SUBWAY}, ["Goldenrod City Subway"] = {K_SUBWAY}}

mapLink["Pokecenter Blackthorn"] = {["Blackthorn City"] = {{10, 20, 11, 20}}, ["Blackthorn City Subway"] = {{3, 14}}}
mapLink["Blackthorn City"] = {["Pokecenter Blackthorn"] = {{29, 39}},["Blackthorn City Pokemart"] = {{23, 39}}, ["Ice Path 1F_B"] = {{52, 14}}, ["Dragons Den Entrance"] = {{27, 5}}, ["Route 45_A"] = {{18, 50, 20, 50}}}
mapLink["Blackthorn City Pokemart"] = {["Blackthorn City"] = {{4, 11}}}

-- Dragons Den
mapLink["Dragons Den Entrance"] = {["Dragons Den"] = {{14, 14}}, ["Blackthorn City"] = {{14, 18}}}
mapLink["Dragons Den"] = {["Dragons Den Entrance"] = {{40, 16}}, ["Dragons Den B1F"] = {{17, 39}},["Dragons Shrine"] = {{66, 45}}}
mapLink["Dragons Den B1F"] = {["Dragons Den"] = {{46, 9}}}
mapLink["Dragons Shrine"] = {["Dragons Den"] = {{17, 39}}}

-- Route 45
mapLink["Route 45_A"] = {["Blackthorn City"] = {{27, 0, 29, 0}}, ["Dark Cave North_A"] = {{6, 5}}}
mapLink["Route 45_B"] = {["Route 46_A"] = {{0, 162, 0, 164}}}

-- Route 46
mapLink["Route 46_B"] = {["Route 29 Stop House"] = {{27, 51, 28, 51}}}
mapLink["Route 46_A"] = {["Route 46_B"] = {0.5}, ["Route 45_B"] = {{40, 5, 40, 7}}, ["Dark Cave South_D"] = {{30, 4}}}

--- Route 111 South
mapLink["Route 111 South"] = {["Route 111 Desert"] = {{17, 7, 22, 7}}, ["Mauville City Stop House 3"] = {{21, 97, 22, 97}}, ["Route 112"] = {{0, 18, 0, 23}}}
mapLink["Route 111 Desert"] = {["Route 111 South"] = {{9, 57, 14, 57}}, ["Route 111 North"] = {{7, 19, 13, 19}}, ["Desert Ruins_A"] = {{45, 104}}}
mapLink["Mauville City Stop House 3"] = {["Mauville City"] = {{3, 12, 4, 12}}, ["Route 111 South"] = {{3, 2, 4, 2}}}
mapLink["Route 111 North"] = {["Route 112_A"] = {{0, 53, 0, 57}}}
mapLink["Route 112_A"] = {["Fiery Path"] = {{16, 13}}, ["Route 111 North"] = {{45, 57, 45, 59}}}
mapLink["Fiery Path"] = {["Route 112_A"] = {{38, 8}}, ["Route 112_B"] = {{36, 48}}}
mapLink["Route 112_B"] = {["Route 111 South"] = {{45, 57, 45, 59}}}

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- HOENN --------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

----------------------------------TOWN/ CITY/ FOREST/ TUNNEL/ CAVE----------------------------------

-- Littleroot Town
mapLink["Littleroot Town"] = {["Player House Littleroot Town"] = {{17, 17}}, ["Prof. Birch House"] = {{27, 17}}, ["Lab Littleroot Town"] = {{18, 29}}, ["Littleroot Town Truck"] = {{29, 32}}, ["Route 101"] = {{22, 0, 24, 0}}}
mapLink["Player House Littleroot Town"] = {["Littleroot Town"] = {{11, 12}}}
mapLink["Prof. Birch House"] = {["Littleroot Town"] = {{11, 12}}}
mapLink["Lab Littleroot Town"] = {["Littleroot Town"] = {{7, 17}}}
mapLink["Littleroot Town Truck"] = {["Littleroot Town"] = {{5, 8, 6, 8}}}
-- Petalburg City
mapLink["Petalburg City"] = {["Petalburg City Wallys House"] = {{9, 8}}, ["Petalburg City Gym_A"] = {{73, 109, 74, 109}}, ["Petalburg City House 2"] = {{14, 25}}, ["Petalburg City House 1"] = {{26, 30}}, ["Mart Petalburg City"] = {{34, 16}}, ["Pokecenter Petalburg City"] = {{27, 22}}, ["Route 102"] = {{44, 22, 44, 26}}, ["Route 104_B"] = {{0, 16, 0, 19}}}
mapLink["Petalburg City Wallys House"] = {["Petalburg City"] = {{7, 10}}}
mapLink["Petalburg City House 1"] = {["Petalburg City"] = {{4, 11}}}
mapLink["Petalburg City House 2"] = {["Petalburg City"] = {{4, 11}}}
mapLink["Pokecenter Petalburg City"] = {["Petalburg City"] = {{7, 22, 9, 22}}}
mapLink["Mart Petalburg City"] = {["Petalburg City"] = {{3, 11}}}
mapLink["Petalburg City Gym_A"] = {["Petalburg City"] = {{19, 11}}}
-- Petalburg Woods
mapLink["Petalburg Woods_A"] = {["Route 104_A"] = {{21, 0, 23, 0}}, ["Route 104_B"] = {{22, 60, 24, 60}}, ["Route 104_C"] = {{51, 60, 53, 60}}}
mapLink["Petalburg Woods_B"] = {["Petalburg Maze"] = {{52, 31}}}
mapLink["Petalburg Maze"] = {["Petalburg Woods_B"] = {{16, 60}}}
-- Rustboro City
mapLink["Rustboro City_A"] = {["Mart Rustboro City"] = {{38, 50}}, ["Pokecenter Rustboro City"] = {{38, 38}}, ["Route 104_A"] = {{33, 65, 41, 65}}, ["Route 115_B"] = {{42, 0, 48, 0}}, ["Route 116_A"] = {{78, 8, 78, 13}}}
mapLink["Rustboro City_B"] = {["Route 104_A"] = {{58, 65, 61, 65}}}
mapLink["Pokecenter Rustboro City"] = {["Rustboro City_A"] ={{7, 22, 9, 22}}}
mapLink["Mart Rustboro City"] = {["Rustboro City_A"] ={{3, 11}}}

-- Rusturf Tunnel
mapLink["Rusturf Tunnel_A"] = {["Route 116_A"] = {{11, 19}}}
mapLink["Rusturf Tunnel_B"] = {["Route 116_B"] = {{24, 32}}, ["Verdanturf Town"] = {{35, 26}}}
-- Dewford Town
mapLink["Dewford Town"] = {["Dewford Town Gym"] = {{22, 22}}, ["Pokecenter Dewford Town"] = {{13, 14}}, ["Route 106"] = {{13, 0, 34, 0}}, ["Route 107"] = {{55, 5, 55, 21}}}
-- Mauville City
mapLink["Mauville City"] = {["Pokecenter Mauville City"] = {{28,13}}, ["Mauville City Stop House 1"] = {{21,30}},["Mauville City Stop House 4"] = {{48, 17, 48, 18}}, ["Mauville City Stop House 3"] = {{21, 4, 22, 4}}}
mapLink["Mauville City Stop House 1"] = {["Mauville City"] = {{3,2,4,2}}, ["Route 110_A"] = {{3,12,4,12}}}
mapLink["Mauville City Stop House 2"] = {["Route 117"] = {{0, 6, 0, 7}}, ["Mauville City"] = {{10, 6, 10, 7}}}
mapLink["Route 110_A"] = {["Route 110_C"] = {{52,36}}, ["Mauville City Stop House 1"] = {{24,3,25,3}}}
mapLink["Route 110_C"] = {["Route 110_A"] = {{20,31,22,31}}, ["New Mauville Entrance"] = {{56,33,57,33}}}
mapLink["New Mauville Entrance"] = {["New Mauville"] = {{12,4,13,4}}, ["Route 110_C"] = {{12,15}}}
mapLink["New Mauville"] = {["New Mauville Entrance"] = {{47,53,48,53}}}
mapLink["Route 118_A"] = {["Mauville City Stop House 4"] = {{3, 16, 3, 17}}}
mapLink["Mauville City Stop House 4"] = {["Mauville City"] = {{0, 6, 0, 7}}, ["Route 118_A"] = {{10, 6, 10, 7}}}
-- Verdanturf Town
mapLink["Verdanturf Town"] = {["Verdanturf House 1"] = {{27, 19}}, ["Verdanturf House 2"] = {{15, 19}}, ["Verdanturf House 3"] = {{8, 19}}, ["Verdanturf Battle Tent"] = {{5, 10}}, ["Pokecenter Verdanturf"] = {{26, 9}}, ["Route 117"] = {{35, 12, 35, 14}}, ["Rusturf Tunnel_B"] = {{11, 2}}, ["Verdanturf Mart"] = {{18, 8}}}
mapLink["Verdanturf Mart"] = {["Verdanturf Town"] = {{6, 10}}}
mapLink["Verdanturf Battle Tent"] = {["Verdanturf Town"] = {{15, 20}}}
mapLink["Verdanturf House 1"] = {["Verdanturf Town"] = {{6, 9}}}
mapLink["Verdanturf House 2"] = {["Verdanturf Town"] = {{8, 9}}}
mapLink["Verdanturf House 3"] = {["Verdanturf Town"] = {{7, 9}}}
-- Lilycove city
mapLink["Pokecenter Lilycove City"] = {["Lilycove City"] = {1}, ["Transmat Station"] = {0.2}}
mapLink["Lilycove City Harbor"] = {["Leev Town Port"] = {{8, 10}}, ["Eumi Island Town"] = {{6, 8}}, ["Lilycove City"] = {{8, 3, 9, 3}}}
mapLink["Lilycove City"] = {["Lilycove City Harbor"] = {{25, 38, 26, 38}}, ["Pokecenter Lilycove City"] = {{26, 20}}, ["Route 121"] = {{0, 22, 0, 23}}, ["Route 124_A"] = {{95, 18, 95, 19}}, ["Lilycove Department Store 1F"] = {{24, 7, 25, 7}}}
mapLink["Lilycove Department Store 1F"] = {["Lilycove City"] = {{7, 12, 8, 12}}, ["Lilycove Department Store 2F"] = {{13, 7}}, ["Lilycove Department Store Elevator"] = {{2, 1}}}
mapLink["Lilycove Department Store 2F"] = {["Lilycove Department Store 1F"] = {{18, 7}}, ["Lilycove Department Store 3F"] = {{13, 7}}, ["Lilycove Department Store Elevator"] = {{2, 1}}}
mapLink["Lilycove Department Store 3F"] = {["Lilycove Department Store 2F"] = {{18, 7}}, ["Lilycove Department Store 4F"] = {{13, 7}}, ["Lilycove Department Store Elevator"] = {{2, 1}}}
mapLink["Lilycove Department Store 4F"] = {["Lilycove Department Store 3F"] = {{18, 7}}, ["Lilycove Department Store 5F"] = {{13, 7}}, ["Lilycove Department Store Elevator"] = {{2, 1}}}
mapLink["Lilycove Department Store 5F"] = {["Lilycove Department Store 4F"] = {{18, 7}}, ["Lilycove Department Store Roof"] = {{13, 7}}, ["Lilycove Department Store Elevator"] = {{2, 1}}}
-- Oldale town
mapLink["Oldale Town"] = {["Oldale Town House 2"] = {{14, 10}}, ["Oldale Town House 1"] = {{29, 26}}, ["Mart Oldale Town"] = {{28, 10}}, ["Pokecenter Oldale Town"] = {{16, 26}}, ["Route 101"] = {{21, 33, 23, 33}}, ["Route 102"] = {{0, 16, 0, 18}}, ["Route 103_A"] = {{20, 0, 24, 0}}}
mapLink["Oldale Town House 1"] = {["Oldale Town"] = {{3, 12}}}
mapLink["Oldale Town House 2"] = {["Oldale Town"] = {{3, 12}}}
mapLink["Mart Oldale Town"] = {["Oldale Town"] = {{3, 11}}}
-- Slateport City
mapLink["Slateport City"] = {["Slateport Harbor"] = {{42, 15}}, ["Slateport Shipyard 1F"] = {{39, 53}}, ["Mart Slateport"] = {{24, 37}}, ["Pokecenter Slateport"] = {{32, 25}}, ["Route 109"] = {{13, 90, 56, 90}}, ["Route 110_B"] = {{30, 0, 32, 0}}}
-- Fallarbor Town
mapLink["Fallarbor Town"] = {["Mart Fallarbor Town"] = {{31, 24}}, ["Pokecenter Fallarbor Town"] = {{30, 12}}, ["Route 113"] = {{40, 9, 40, 22}}, ["Route 114"] = {{0, 18, 0, 19}}}
-- Lavaridge Town
mapLink["Lavaridge Town"] = {["Lavaridge Mart"] = {{28, 11}}, ["Pokecenter Lavaridge Town"] = {{20, 12}}, ["Route 112_C"] = {{43, 14, 43, 18}}} -- links
mapLink["Mt. Chimney"] = {["Cable Car Station 2"] = {{26, 40, 27, 40}}, ["Jagged Pass_A"] = {{32, 50, 34, 50}}}
mapLink["Jagged Pass_A"] = {["Mt. Chimney"] = {{19, 0, 21, 0}}, ["Jagged Pass_B"] = {{19, 34, 19, 35}}}
mapLink["Jagged Pass_B"] = {["Jagged Pass_C"] = {{19, 99, 23, 99}}}
mapLink["Jagged Pass_C"] = {["Route 112_C"] = {{20, 110, 22, 110}}}
-- Mossdeep City
mapLink["Mossdeep City"] = {["Mossdeep City Space Center 1F"] = {{83, 21}}, ["Mossdeep Pokemart"] = {{51, 21}}, ["Pokecenter Mossdeep City"] = {{36, 21}}, ["Route 124_A"] = {{0, 7, 0, 15}}, ["Route 125"] = {{25, 0, 38, 0}}, ["Route 127_A"] = {{29, 55, 44, 55}}}
mapLink["Mossdeep City Space Center 1F"] = {["Mossdeep City Space Center 2F"] = {{18, 1}}, ["Mossdeep City"] = {{10, 12}}}
mapLink["Mossdeep City Space Center 2F"] = {["Mossdeep City Space Center 1F"] = {{18, 1}}}
-- Sootopolis City
mapLink["Sootopolis City"] = {["Pokecenter Sootopolis City"] = {{79, 56}},["Sootopolis Mart"] = {{23, 56}}, ["Sootopolis City Underwater"] = {{50, 91}}}
mapLink["Sootopolis City Underwater"] = {["Route 126 Underwater_A"] = {{17, 20}}, ["Sootopolis City"] = {{17, 11}}}
-- Pacifidlog Town
mapLink["Pacifidlog Town"] = {["Pokecenter Pacifidlog Town"] = {{19, 12}}, ["Route 131"] = {{40, 13, 40, 17}}, ["Route 132"] = {{0, 11, 0, 14}}}
--Fortree City
mapLink["Fortree City"] = {["Fortree Mart"] = {{7, 23}}, ["Pokecenter Fortree City"] = {{8, 11}}, ["Route 119A"] = {{0, 12, 0, 17}}, ["Route 120_A"] = {{54, 13, 54, 16}}}

-- Fiery path
mapLink["Fiery Path"] = {["Route 112_A"] = {{38, 8}}, ["Route 112_B"] = {{36, 49}}}
-- Meteor Falls
mapLink["Meteor Falls 1F 2R_A"] = {["Meteor Falls 1F 2R_B"] = {{19, 26, 23, 26}}, ["Meteor falls B1F 1R_A"] = {{9, 22}}}
mapLink["Meteor Falls 1F 2R_B"] = {["Meteor falls 1F 1R_B"] = {{19, 52}}, ["Meteor falls B1F 1R_A"] = {{33, 41}}, ["Meteor falls B1F 1R_B"] = {{11, 35}}}
mapLink["Meteor Falls B1F 2R"] = {["Meteor falls B1F 1R_B"] = {{8, 22}}}
mapLink["Meteor falls 1F 1R_A"] = {["Route 114"] = {{46, 22}}, ["Meteor falls 1F 1R_X"] = {{21, 28}}}
mapLink["Meteor falls 1F 1R_B"] = {["Meteor Falls 1F 2R_B"] = {{27, 4}}, ["Meteor falls 1F 1R_A"] = {{26, 18, 35, 18}}}
mapLink["Meteor falls 1F 1R_C"] = {["Meteor falls B1F 1R_A"] = {{22, 5}}}
mapLink["Meteor falls 1F 1R_D"] = {["Meteor falls B1F 1R_B"] = {{46, 32}}}
mapLink["Meteor falls 1F 1R_X"] = {["Meteor falls 1F 1R_A"] = {{21, 25}}, ["Route 115_A"] = {{19, 46}}}
mapLink["Meteor falls B1F 1R_A"] = {["Meteor falls 1F 1R_C"] = {{2, 29}}, ["Meteor Falls 1F 2R_B"] = {{22, 21}}, ["Meteor Falls 1F 2R_A"] = {{6, 8}}}
mapLink["Meteor falls B1F 1R_B"] = {["Meteor Falls 1F 2R_B"] = {{8, 14}}, ["Meteor Falls B1F 2R"] = {{20, 3}}, ["Meteor falls 1F 1R_D"] = {{22, 44}}}
-- Mt. Pyre
mapLink["Mt. Pyre 1F"] = {["Route 122"] = {{19, 27, 20, 27}}, ["Mt. Pyre 2F"] = {{2, 4}}}
mapLink["Mt. Pyre 2F"] = {["Mt. Pyre 1F"] = {{2, 5}}, ["Mt. Pyre 3F"] = {{26, 4}}}
mapLink["Mt. Pyre 3F"] = {["Mt. Pyre 2F"] = {{23, 4}}, ["Mt. Pyre 4F"] = {{2, 3}}, ["Mt. Pyre Exterior"] = {{12, 27, 13, 27}}}
mapLink["Mt. Pyre 4F"] = {["Mt. Pyre 3F"] = {{2, 18}}}
mapLink["Mt. Pyre Exterior"] = {["Mt. Pyre 3F"] = {{8, 133}}, ["Mt. Pyre Summit"] = {{23, 0, 25, 0}}}
mapLink["Mt. Pyre Summit"] = {["Mt. Pyre Exterior"] = {{24, 79, 26, 79}}}
-- Sky Pillar
mapLink["Sky Pillar Entrance_A"] = {["Route 131"] = {{20, 49, 36, 49}}, ["Sky Pillar Entrance Cave 1F"] = {{26, 32}}}
mapLink["Sky Pillar Entrance_B"] = {["Sky Pillar Entrance Cave 1F"] = {{35, 23}}, ["Sky Pillar 1F"] = {{27, 6}}}
mapLink["Sky Pillar 1F"] = {["Sky Pillar Entrance_B"] = {{7, 13, 8, 13}}, ["Sky Pillar 2F"] = {{13, 5}}}
mapLink["Sky Pillar 2F"] = {["Sky Pillar 1F"] = {{13, 7}}, ["Sky Pillar 3F"] = {{7, 5}}}
mapLink["Sky Pillar 3F"] = {["Sky Pillar 2F"] = {{7, 6}}, ["Sky Pillar 4F_A"] = {{3, 6}}, ["Sky Pillar 4F_B"] = {{4, 12}}}
mapLink["Sky Pillar 4F_A"] = {["Sky Pillar 3F"] = {{3, 7}}, ["Sky Pillar 5F"] = {{8, 12}}}
mapLink["Sky Pillar 4F_B"] = {["Sky Pillar 3F"] = {{4, 13}}}
mapLink["Sky Pillar 5F"] = {["Sky Pillar 4F_A"] = {{8, 13}}, ["Sky Pillar 6F"] = {{13, 12}}}
mapLink["Sky Pillar 6F"] = {["Sky Pillar 5F"] = {28, 26}}
mapLink["Sky Pillar Entrance Cave 1F"] = {["Sky Pillar Entrance_A"] = {{7, 17}}, ["Sky Pillar Entrance_B"] = {{17, 6}}}
-- Moon
mapLink["Moon 1F_A"] = {["Moon_A"] = {{8, 45}}, ["Moon_B"] = {{8, 24}}, ["Moon B1F_C"] = {{4, 32}}}
mapLink["Moon 1F_B"] = {["Moon_B"] = {{17, 15}}, ["Moon_C"] = {{47, 15}}, ["Moon B1F_A"] = {{32, 9}}}
mapLink["Moon 1F_C"] = {["Moon_C"] = {{56, 24}}, ["Moon B1F_B"] = {{59, 24}}}
mapLink["Moon 1F_D"] = {["Moon_D"] = {{56, 45}}, ["Moon B1F_D"] = {{59, 45}}}
mapLink["Moon 2F_A"] = {["Moon B1F_D"] = {{6, 4}}, ["Moon 2F_B"] = {{7, 3}}}
mapLink["Moon 2F_B"] = {["Moon 2F_A"] = {{6, 3}}, ["Moon_E"] = {{6, 8}}}
mapLink["Moon B1F_A"] = {["Moon 1F_B"] = {{32, 9}}}
mapLink["Moon B1F_B"] = {["Moon 1F_C"] = {{57, 16}}}
mapLink["Moon B1F_C"] = {["Moon 1F_A"] = {{5, 32}}}
mapLink["Moon B1F_D"] = {["Moon B1F_C"] = {{28, 38, 28, 39}}, ["Moon 1F_D"] = {{59, 45}}, ["Moon 2F_A"] = {{32, 19}}}
mapLink["Moon_A"] = {["Moon 1F_A"] = {{7, 40}}}
mapLink["Moon_B"] = {["Moon_A"] = {{19, 34, 21, 34}}, ["Moon 1F_A"] = {{7, 19}}, ["Moon 1F_B"] = {{15, 10}}}
mapLink["Moon_C"] = {["Moon_D"] = {{40, 30, 44, 30}}, ["Moon 1F_B"] = {{45, 10}}, ["Moon 1F_C"] = {{53, 19}}}
mapLink["Moon_D"] = {["Moon_A"] = {{26, 37, 26, 39}}, ["Moon 1F_D"] = {{53, 40}}}
mapLink["Moon_E"] = {["Moon 2F_A"] = {{30, 18}}}
-- Victory Road
mapLink["Ever Grande City_A"] = {["Pokecenter Ever Grande City"] = {{45, 64}}, ["Route 128"] = {{0, 100, 0, 114}}, ["Victory Road Hoenn 1F_A"] = {{27, 56}}}
mapLink["Ever Grande City_B"] = {["Pokemon League Hoenn"] = {{30, 9, 31, 9}}, ["Victory Road Hoenn 1F_B"] = {{30, 34}}}
mapLink["Pokemon League Hoenn"] = {["Ever Grande City_B"] = {{10, 28}}}
mapLink["Victory Road Hoenn 1F_A"] = {["Ever Grande City_A"] = {{21, 55}}, ["Victory Road Hoenn B1F_B"] = {{27, 40}}, ["Victory Road Hoenn B1F_A"] = {{9, 17}}}
mapLink["Victory Road Hoenn 1F_B"] = {["Ever Grande City_B"] = {{46, 10}}, ["Victory Road Hoenn 1F_A"] = {{34, 15, 38, 15}}, ["Victory Road Hoenn B1F_A"] = {{40, 7}}}
mapLink["Victory Road Hoenn 1F_C"] = {["Victory Road Hoenn B1F_A"] = {{48, 52}}}
mapLink["Victory Road Hoenn B1F_A"] = {["Victory Road Hoenn 1F_A"] = {{13, 4}}, ["Victory Road Hoenn 1F_B"] = {{46, 7}}, ["Victory Road Hoenn 1F_C"] = {{53, 35}}, ["Victory Road Hoenn B2F_A"]= {{37, 33}}}
mapLink["Victory Road Hoenn B1F_B"] = {["Victory Road Hoenn B1F_C"] = {{17, 22, 17, 25}}, ["Victory Road Hoenn 1F_A"] = {{26, 29}}, ["Victory Road Hoenn B2F_E"] = {{24, 23}}}
mapLink["Victory Road Hoenn B1F_C"] = {["Victory Road Hoenn B2F_B"] = {{11, 36}}}
mapLink["Victory Road Hoenn B1F_D"] = {["Victory Road Hoenn B2F_A"] = {{57, 3}}}
mapLink["Victory Road Hoenn B2F_A"] = {["Victory Road Hoenn B1F_D"] = {{56, 3}}, ["Victory Road Hoenn B1F_A"] = {{37, 33}}}
mapLink["Victory Road Hoenn B2F_B"] = {["Victory Road Hoenn B2F_C"] = {{12, 35, 12, 38}}}
mapLink["Victory Road Hoenn B2F_C"] = {["Victory Road Hoenn B2F_F"] = {{14, 24, 18, 24}}}
mapLink["Victory Road Hoenn B2F_D"] = {["Victory Road Hoenn B2F_C"] = {{14, 25, 18, 25}}, ["Victory Road Hoenn B2F_A"] = {{4, 7, 9, 7}}, ["Victory Road Hoenn B2F_F"] = {{10, 16, 14, 16}}}
mapLink["Victory Road Hoenn B2F_E"] = {["Victory Road Hoenn B2F_F"] = {{24, 17, 28, 17}}, ["Victory Road Hoenn B1F_B"] = {{26, 14}}}
mapLink["Victory Road Hoenn B2F_F"] = {["Victory Road Hoenn B2F_E"] = {{24, 16, 28, 16}}}
-- Abandoned Ship
mapLink["Abandoned Ship 1F_A"] = {["Abandoned Ship B1F"] = {{23, 4}}, ["Abandoned Ship 1F Room 2_A"] = {}, ["Abandoned Ship 1F Room 2_B"] = {}, ["Abandoned Ship Exterior_A"] = {{13, 12, 14, 12}}}
mapLink["Abandoned Ship B1F Room 1"] = {["Abandoned Ship B1F"] = {{14, 10, 15, 10}}}
mapLink["Abandoned Ship B1F"] = {["Storage Unit"] = {1}, ["Abandoned Ship B1F Room 4"] = {1}, ["Abandoned Ship B1F Room 3"] = {1}, ["Abandoned Ship B1F Room 2"] = {1}, ["Abandoned Ship B1F Room 1"] = {{12, 4}}, ["Abandoned Ship 1F_B"] = {1}, ["Abandoned Ship 1F_A"] = {{20, 3}}}
mapLink["Abandoned Ship Exterior_A"] = {["Abandoned Ship 1F_A"] = {{11, 8}}, --[[["Route 108"] = {{11, 14, 12, 14}} về 108 bị kẹt]]}
----------------------------------ROUTE----------------------------------
-- Route 101
mapLink["Route 101"] = {["Littleroot Town"] = {{21, 49, 23, 49}}, ["Oldale Town"] = {{21, 0, 23, 0}}}
-- Route 102
mapLink["Route 102"] = {["Oldale Town"] = {{83, 17, 83, 19}}, ["Petalburg City"] = {{0, 12, 0, 16}}}
-- Route 103
mapLink["Route 103_A"] = {["Oldale Town"] = {{25, 35, 29, 35}}, ["Route 103_B"] = {{51, 11, 51, 25}}}
mapLink["Route 103_B"] = {["Route 103_C"] = {{78, 16}}, ["Route 103_A"] = {{50, 12, 50, 26}}, ["Route 103_D"] = {{64, 8}}, ["Route 110_B"] = {{100, 19, 100, 21}}}
mapLink["Route 103_C"] = {["Route 103_B"] = {{78, 18}}}
mapLink["Route 103_D"] = {["Route 103_B"] = {{64, 10, 65, 10}}}
-- Route 104 <A - B>
--- Route 104 B ( Khu ở dưới gần Petalburg City)
mapLink["Route 104_B"] = {["Route 104 Sailor House"] = {{45, 97}}, ["Petalburg Woods_A"] = {{34, 79, 36, 79}}, ["Route 105"] = {{31, 148, 56, 148}}, ["Petalburg City"] = {{78, 110, 78, 113}}}
mapLink["Route 104 Sailor House"] = {["Route 104_B"] = {{4, 11}}}
--- Route 104 A ( Khu ở trên gần Rustboro City)
mapLink["Route 104_A"] = {["Route 104 House"] = {{14, 35}}, ["Petalburg Woods_A"] = {{22, 51, 24, 51}}, ["Rustboro City_A"] = {{33, 0, 41, 0}}, ["Rustboro City_B"] = {{58, 0, 61, 0}}}
mapLink["Route 104 House"] = {["Route 104_A"] = {{8, 11}}}
-- Route 105
mapLink["Route 105"] = {["Island Cave_A"] = {{24, 29}}, ["Route 104_B"] = {{19, 0, 44, 0}}, ["Route 106"] = {{12, 125, 56, 125}}}
-- Route 106
mapLink["Route 106"] = {["Granite Cave 1F_A"] = {{75, 34}}, ["Dewford Town"] = {{96, 42, 117, 42}} , ["Route 105"] = {{7, 0, 51, 0}}}
-- Route 107
mapLink["Route 107"] = {["Dewford Town"] = {{0, 5, 0, 21}}, ["Route 108"] = {{85, 4, 85, 22}}}
-- Route 108
mapLink["Route 108"] = {["Abandoned Ship Exterior_A"] = {{107, 14}}, ["Route 107"] = {{0, 8, 0, 26}}, ["Route 109"] = {{150, 6, 150, 17}}}
-- Route 109
mapLink["Route 109"] = {["Route 108"] = {{0, 57, 0, 68}}, ["Slateport City"] = {{10, 0, 53, 0}}}
-- Route 110
mapLink["Route 110_A"] = {["Mauville City Stop House 1"] = {{24, 3, 25, 3}}, ["Route 110_B"] = {{41, 60, 41, 62}}, ["Route 110_C"] = {{20, 32, 22, 32}}}
mapLink["Route 110_B"] = {["Route 103_B"] = {{0, 98, 0, 100}}, ["Slateport City"] = {{23, 140, 25, 140}}, ["Cycle Road Stop House 1"] = {{25, 120}}, ["Route 110_A"] = {{39, 60, 39, 62}}}
mapLink["Route 110_C"] = {["Route 110_A"] = {{20, 30, 22, 30}}, ["New Mauville Entrance"] = {{56, 33, 57, 33}}}
mapLink["Route 110_D"] = {["Cycle Road Stop House 1"] = {{29, 120}}, ["Cycle Road Stop House 2"] = {{30, 25}}}
-- Route 111
mapLink["Route 111 North"] = {["Route 111 Desert"] ={{27, 65, 35, 65}}, ["Route 112_A"] = {{0, 53, 0, 57}}, ["Route 113"] = {{0, 17, 0, 23}}}
-- Route 112
mapLink["Route 112_A"] = {["Fiery Path"] = {{16, 13}}, ["Route 111 North"] = {{45, 9, 45, 11}}}
mapLink["Route 112_B"] = {["Cable Car Station 1"] = {{29, 33, 30, 33}}, ["Fiery Path"] = {{8, 43}}, ["Route 111 South"] = {{45, 57, 45, 59}}}
mapLink["Route 112_C"] = {["Lavaridge Town"] = {{0, 59, 0, 62}}, ["Jagged Pass_C"] = {{11, 55}}, ["Route 112_B"] = {{20, 61, 20, 63}}}
-- Route 113
mapLink["Route 113"] = {["Fallarbor Town"] = {{0, 9, 0, 22}}, ["Route 111 North"] = {{145, 19, 145, 25}}}
-- Rotue 114
mapLink["Route 114"] = {["Fallarbor Town"] = {{80, 18, 80, 19}}, ["Meteor falls 1F 1R_A"] = {{12, 119}}}
-- Route 115
mapLink["Route 115_A"] = {["Mineral Site_A"] = {{}}, ["Meteor falls 1F 1R_X"] = {{74, 73}}}
mapLink["Mineral Site_A"] = {["Route 115_A"] = {{9, 6}}}
mapLink["Route 115_B"] = {["Rustboro City_A"] = {{54, 150, 60, 150}}}
mapLink["Route 115_D"] = {["Meteor falls 1F 1R_C"] = {{57, 30}}}
-- Route 116
mapLink["Route 116_A"] = {["Route 116 House"] = {{48, 18}}, ["Rustboro City_A"] = {{0, 18, 0, 23}}, ["Rusturf Tunnel_A"] = {{62, 19}}}
mapLink["Route 116_B"] = {["Rusturf Tunnel_B"] = {{87, 22}}}
mapLink["Route 116 House"] = {["Route 116_A"] = {{5, 9}}}
-- Route 117
mapLink["Route 117"] = {["Mauville City Stop House 2"] = {{101, 31, 101, 33}}, ["Verdanturf Town"] = {{0, 28, 0, 30}}}
-- Route 118
mapLink["Route 118_A"] = {["Mauville City Stop House 4"] = {{3, 16, 3, 17}}, ["Route 118_B"] = {{30, 18, 30, 27}}}
mapLink["Route 118_B"] = {["Route 119B"] = {{58, 0, 60, 0}}, ["Route 123_C"] = {80, 18, 80, 20}, ["Route 118_A"] = {{28, 19, 28, 27}}}
-- Route 119
mapLink["Route 119A"] = {["Weather Institute 1F"] = {{9, 40}}, ["Fortree City"] = {{55, 5, 55, 8}}, ["Route 119B"] = {{11, 100, 12, 100}}}
mapLink["Route 119B"] = {["Route 118_B"] = {{25, 100, 27, 100}}, ["Route 119A"] = {{9, 0, 10, 0}}}
-- Route 120
mapLink["Route 120_A"] = { ["Fortree City"] = {{0, 6, 0, 8}}, ["Route 121"] = {{50, 99, 50, 101}}, ["Route 120_B"] = {{27, 23}}}
mapLink["Route 120_B"] = {["Route 120_A"] = {{32, 10, 33, 10}}}
-- Route 121
mapLink["Route 121"] = {["Lilycove City"] = {{85, 6, 85, 7}}, ["Route 120_A"] = {{0, 12, 0, 14}}, ["Route 122"] = {{28, 35, 33, 35}}, ["Hoenn Safari Zone Lobby"] = {{40, 4, 41, 4}}}
-- Route 122
mapLink["Route 122"] = {["Route 121"] = {{14, 0, 19, 0}}, ["Route 123_A"] = {{64, 60, 68, 60}}, ["Mt. Pyre 1F"] = {{60, 38}}}
-- Route 123
mapLink["Route 123_A"] = {["Route 122"] = {{173, 0, 177, 0}}, ["Route 123_B"] = {{158, 12, 159, 12}}, ["Route 123_C"] = {{139, 18, 139, 23}}}
mapLink["Route 123_B"] = {["Route 123_C"] = {{62, 19, 66, 19}}}
mapLink["Route 123_C"] = {["Berry Masters House"] = {{34, 9}}, ["Route 118_B"] = {{0, 10, 0, 12}}, ["Berry Garden"] = {{21, 0, 23, 0}}}
-- Route 124
mapLink["Route 124_A"] = {["Treasure Hunter House"] = {{67, 35}}, ["Lilycove City"] = {{0, 25}}, ["Mossdeep City"] = {{91, 32, 91, 39}}, ["Route 126_A"] = {{51, 60, 55, 60}}, ["Route 124 Underwater_A"] = {{28, 43}}, ["Route 124 Underwater_B"] = {{41, 36}}, ["Route 124 Underwater_D"] = {{73, 27}}, ["Route 124 Underwater_E"] = {{61, 46}}}
mapLink["Route 124_B"] = {["Route 124 Underwater_C"] = {{12, 8}}, ["Route 124 Underwater_D"] = {{71, 8}}}
mapLink["Route 124_C"] = {["Route 124 Underwater_A"] = {{6, 45}}}
mapLink["Route 124_D"] = {["Route 124 Underwater_A"] = {{30, 55}}}
mapLink["Route 124 Underwater_A"] = {["Route 124_A"] = {{29, 52}}, ["Route 124_C"] = {{14, 54}}, ["Route 124_D"] = {{36, 67}}}
mapLink["Route 124 Underwater_B"] = {["Route 124_A"] = {{31, 34}}}
mapLink["Route 124 Underwater_C"] = {["Route 124_B"] = {{8, 6}}}
mapLink["Route 124 Underwater_D"] = {["Route 124_B"] = {{52, 8}}, ["Route 124_A"] = {{52, 17}}}
mapLink["Route 124 Underwater_E"] = {["Route 124_A"] = {{57, 57}}}
-- Route 125
mapLink["Route 125"] = {["Low Tide Entrance Room_A"] = {{19, 16}}, ["Mossdeep City"] = {{24, 40, 37, 40}}, ["Route 135"] = {{47, 0, 51, 0}}}
-- Rotue 126
mapLink["Route 126_A"] = {["Route 124_A"] = {{75, 0, 81, 0}},["Route 127_A"] = {{125, 64, 125, 74}}, ["Route 126 Underwater_A"] = {{15, 71}}, ["Route 126 Underwater_B"] = {{20, 105}}}
mapLink["Route 126 Underwater_A"] = {["Route 126_A"] = {{15, 71}}, ["Route 126_C"] = {{46, 31}}, ["Sootopolis City Underwater"] = {{58, 96}}}
mapLink["Route 126 Underwater_B"] = {["Route 126_B"] = {{11, 114}}, ["Route 126_A"] = {{20, 105}}}
mapLink["Route 126 Underwater_C"] = {["Route 126_C"] = {{66, 8}}, ["Route 126_D"] = {{5, 14}}}
mapLink["Route 126_B"] = {["Route 126 Underwater_B"] = {{11, 114}}}
mapLink["Route 126_C"] = {["Route 126 Underwater_A"] = {{46, 31}}, ["Route 126 Underwater_C"] = {{66, 8}}}
mapLink["Route 126_D"] = {["Route 126 Underwater_C"] = {{15, 14}}}
-- Route 127
mapLink["Route 127_A"] = {["Mossdeep City"] = {{37, 0, 52, 0}}, ["Route 126_A"] = {{0, 43, 0, 53}}, ["Route 128"] = {{38, 93, 52, 93}}}
-- Route 128
mapLink["Route 128"] = {["Ever Grande City_A"] = {{123, 32, 123, 46}}, ["Route 127_A"] = {{23, 0, 37, 0}}, ["Route 129_A"] = {{27, 59, 51, 59}} }
-- Route 129
mapLink["Route 129_A"] = {["Route 128"] = {{57, 0, 71, 0}}, ["Route 130_A"] = {{0, 7, 0, 43}}, ["Route 129 Underwater"] = {{127, 23}}}
mapLink["Route 129 Underwater"] = {["Route 129_A"] = {{56, 16}}, ["Route 129_B"] = {{38, 32}}, ["Route 130 Underwater_A"] = {{0, 10, 0, 22}}}
mapLink["Route 129_B"] = {["Route 129 Underwater"] = {{82, 43}}}
-- Route 130
mapLink["Route 130_A"] = {["Route 129_A"] = {{80, 7, 80, 43}}, ["Route 131"] = {{0, 34, 0, 43}},["Route 130 Underwater_B"] = {{75, 10}} }
mapLink["Route 130 Underwater_A"] = {["Route 130_B"] = {{15, 6}}, ["Route 129 Underwater"] = {{80, 21, 80, 36}}}
mapLink["Route 130 Underwater_B"] = {["Route 130_A"] = {{76, 10}}}
mapLink["Route 130_B"] = {["Route 130 Underwater_A"] = {{15, 6}}}
-- Route 131
mapLink["Route 131"] = {["Pacifidlog Town"] = {{0, 28, 0, 32}}, ["Route 130_A"] = {{80, 31, 80, 40}}, ["Sky Pillar Entrance_A"] = {{34, 1, 50, 1}}}
-- Route 132
mapLink["Route 132"] = {["Route 133"] = {{0, 15, 0, 18}}}
-- Route 133
mapLink["Route 133"] = {["Route 134"] = {{0, 27, 0, 48}}}
-- Route 134
mapLink["Route 134"] = {["Slateport City"] = {{0, 6, 0, 19}}}

-- Route 135
mapLink["Route 135"] = {["Nap Town"] = {{34, 0, 39, 0}}, ["Route 125"] = {{32, 87, 36, 87}}}
----------------------------------MART----------------------------------
-- Mart Town
mapLink["Mart Oldale Town"] = {["Oldale Town"] = {{3, 11}}} -- Done
mapLink["Mart Petalburg City"] = {["Petalburg City"] = {{3, 11}}} -- Done
mapLink["Mart Rustboro City"] = {["Rustboro City_A"] = {{3, 11}}} -- Done
mapLink["Verdanturf Mart"] = {["Verdanturf Town"] = {{6,10}}} -- Done
mapLink["Mossdeep Pokemart"] = {["Mossdeep City"] = {{6, 12, 7, 12}}} -- Done
mapLink["Mart Fallarbor Town"] = {["Fallarbor Town"] = {{3, 11}}} -- Done
mapLink["Mart Mauville City"] = {["Mauville City"] = {{4,11}}} -- Done
mapLink["Mart Slateport"] = {["Slateport City"] = {{6, 11}}} -- Done
mapLink["Sootopolis Mart"] = {["Sootopolis City"] = {{3, 11}}} -- Done
mapLink["Fortree Mart"] = {["Fortree City"] = {{4,11}}} -- Done
mapLink["Lavaridge Mart"] = {["Lavaridge Town"] = {{6, 10}}} -- Done

----------------------------------POKECENTER----------------------------------
-- Pokecenter
mapLink["Pokecenter Oldale Town"] = {["Oldale Town"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Petalburg City"] = {["Petalburg City"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Rustboro City"] = {["Rustboro City_A"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Verdanturf"] = {["Verdanturf Town"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Dewford Town"] = {["Dewford Town"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Eastern Peak"] = {["Valley Of Steel Eastern Peak"] = {{7, 22, 9, 22}}}
mapLink["Pokecenter Ever Grande City"] = {["Ever Grande City_A"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Fallarbor Town"] = {["Fallarbor Town"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Fortree City"] = {["Fortree City"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Lavaridge Town"] = {["Lavaridge Town"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Leev Town"] = {["Leev Town"] = {{7, 22, 9, 22}}}
mapLink["Pokecenter Lilycove City"] = {["Lilycove City"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Mauville City"] = {["Mauville City"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Mossdeep City"] = {["Mossdeep City"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Pacifidlog Town"] = {["Pacifidlog Town"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Slateport"] = {["Slateport City"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
mapLink["Pokecenter Sootopolis City"] = {["Sootopolis City"] = {{7, 22, 9, 22}}, ["Transmat Station"] = {{8, 3}}}
--------------------------------------EXCAVATION ----------------------------------------
mapLink["Mineral Site_A"] = {["Mineral Site_B"] = {{11, 15}}}
mapLink["Mineral Site_B"] = {["Mineral Site_A"] = {{11, 17}}}
mapLink["Natural Site"] = {["Route 119A"] = {{6, 7}}}
mapLink["Historical Site_A"] = {["Route 111 Desert"] = {{2, 7}}}
mapLink["Feral Site_A"] = {["Fiery Path"] = {{8, 8}}}
mapLink["Feral Site_B"] = {["Fiery Path"] = {{8, 8}}}

mapLink["Haunted Site"] = {["Rusturf Tunnel_C"] = {{3, 8}}}
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- SINNOH --------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
---Canalave
mapLink["Canalave Pokecenter"] = {["Canalave City"] = {{7,15,8,15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Canalave City"] = {["Canalave Pokemart"] = {{36, 32}}, ["Canalave Pokecenter"] = {{40,15}}, ["Route 218 Stop House 2"] = {{46,42,46,43}}, ["Vermilion City_A"] = {0.5}, ["Olivine City"] = {0.5}, ["Lilycove City Harbor"] = {0.5}, ["Iron Island"] = {1}, ["Vulcan Island Shore"] = {5}}
mapLink["Canalave Pokemart"] = {["Canalave City"] = {{4, 11, 5, 11}}}
mapLink["Route 218 Stop House 2"] = {["Canalave City"] = {{0, 6, 0, 7}}, ["Route 218"] = {{10,6,10,7}}}
mapLink["Route 218"] = {["Route 218 Stop House 2"] = {{3,18,3,19}},["Route 218 Stop House 1"] = {{72, 22, 72, 23}}}
mapLink["Route 218 Stop House 1"] = {["Jubilife City"] = {{10, 6, 10, 7}}, ["Route 218"] = {{0, 6, 0, 7}}}

---Jubilife
mapLink["Jubilife City"] = {["Pokecenter Jubilife City"] = {{55, 42}}, ["Mart Jubilife City"] = {{54, 32}}, ["Route 202"] = {{49, 63, 51, 63}}, ["Route 204_A"] = {{48, 0, 51, 0}}, ["Route 203"] = {{74, 24, 74, 26}}, ["Route 218 Stop House 1"] = {{1, 25, 1, 26}}, ["Jubilife TV 1F"] = {1}, ["Jubilife House 1"] = {1}, ["Jubilife House 2"] = {1}, ["Jubilife House 3"] = {1}, ["Jubilife Trainers School"] = {{44, 41}}, ["Jubilife Global Station"] = {1}, ["Poketch Company 1F"] = {1}}
mapLink["Mart Jubilife City"] = {["Jubilife City"] = {{4, 11, 5, 11}}}
mapLink["Pokecenter Jubilife City"] = {["Jubilife City"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Jubilife Trainers School"] = {["Jubilife City"] = {{7, 10}}}

---Sandgem
mapLink["Route 202"] = {["Sandgem Town"] = {{41, 32, 44, 32}}, ["Jubilife City"] = {{26, 0, 28, 0}}}
mapLink["Sandgem Town"] = {["Route 202"] = {{38, 0, 41, 0}}, ["Route 201"] = {{0, 10, 0, 14}}, ["Pokecenter Sandgem Town"] = {{24, 8}}, ["Mart Sandgem Town"] = {{40, 9}}, ["Rowan Lab"] = {1}, ["Sandgem Town House"] = {{7, 23}}, ["Dawn House"] = {1}, ["Route 219"] = {{29, 29, 35, 29}}}
mapLink["Mart Sandgem Town"] = {["Sandgem Town"] = {{4, 11, 5, 11}}}
mapLink["Pokecenter Sandgem Town"] = {["Sandgem Town"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Route 201"] = {["Sandgem Town"] = {{100, 6, 100, 9}}, ["Twinleaf Town"] = {{47, 30, 49, 30}}, ["Lake Verity"] = {{10, 0}}}
mapLink["Twinleaf Town"] = {["Route 201"] = {{14, 0, 16, 0}}, ["Twinleaf Town Player House"] = {1}, ["Twinleaf Town House 2"] = {{20, 14}}, ["Twinleaf Town Revival House"] = {1}, ["Link"] = {1}, ["Route 219"] = {{31, 36, 31, 39}}}
mapLink["Route 219"] = {["Twinleaf Town"] = {{0, 16, 0, 19}}, ["Sandgem Town"] = {{33, 0, 39, 0}}, ["Route 220"] = {{16, 36, 31, 36}}}
mapLink["Route 220"] = {["Route 219"] = {{12, 0, 23, 0}}, ["Route 221"] = {{66, 6, 66, 20}}}
mapLink["Route 221"] = {["Route 220"] = {{0, 10, 0, 25}}, ["Pal Park"] = {{105, 15, 106, 15}}}
mapLink["Pal Park"] = {["Route 221"] = {{21, 44, 22, 44}}}
mapLink["Route 203"] = {["Jubilife City"] = {{0, 20, 0, 22}}, ["Oreburgh Gate 1F"] = {{57, 9}}}
mapLink["Oreburgh Gate 1F"] = {["Route 203"] = {{2, 19}}, ["Oreburgh City"] = {{27, 19}}, ["Oreburgh Gate B1F"] = {{20, 4}}}
mapLink["Oreburgh Gate B1F"] = {["Oreburgh Gate 1F"] = {{51, 4}} , ["Legends Cave"] = {{32, 8}}}
mapLink["Legends Cave"] = {["Oreburgh Gate B1F"] = {{12, 25}}}
mapLink["Sandgem Town House"] = {["Sandgem Town"] = {{3, 8, 4, 8}}}
mapLink["Twinleaf Town House 2"] = {["Twinleaf Town"] = {{4, 10}}}

---Oreburgh
mapLink["Oreburgh City"] = {["Oreburgh Gate 1F"] = {{1, 13}}, ["Pokecenter Oreburgh City"] = {{43, 17}}, ["Mart Oreburgh City"] = {{26, 9}}, ["Route 207_A"] = {{35, 0, 40, 0}}, ["Oreburgh Mine B1F"] = {{41, 46, 44, 46}}}
mapLink["Pokecenter Oreburgh City"] = {["Oreburgh City"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Mart Oreburgh City"] = {["Oreburgh City"] = {{4, 11, 5, 11}}}
mapLink["Oreburgh Mine B1F"] = {["Oreburgh City"] = {{11, 5, 14, 5}}, ["Oreburgh Mine B2F 1R"] = {1}}
mapLink["Oreburgh Mine B2F 1R"] = {["Oreburgh Mine B1F"] = {1}, ["Oreburgh Mine B2F 2R"] = {1}}
mapLink["Oreburgh Mine B2F 2R"] = {["Oreburgh Mine B2F 1R"] = {1}, ["Oreburgh Mine B1F"] = {1}}
mapLink["Route 207_A"] = {["Oreburgh City"] = {{9, 28, 14, 28}}}
mapLink["Route 207_B"] = {["Mt. Coronet South"] = {{56, 6}}, ["Route 206_B"] = {{14, 0, 17, 0}}}

mapLink["Route 207_C"] = {["Mt. Coronet 2F_A"] = {{63, 9}}}

mapLink["Route 204_A"] = {["Jubilife City"] = {{12, 68, 15, 68}}, ["Ravaged Path_A"] = {{10, 34}}}
mapLink["Ravaged Path_A"] = {["Route 204_A"] = {{21, 46}}}
mapLink["Ravaged Path_B"] = {["Route 204_B"] = {{30, 41}}}
mapLink["Route 204_B"] = {["Ravaged Path_B"] = {{19, 26}}, ["Floaroma Town"] = {{8, 0, 11, 0}}}

--Floaroma Town
mapLink["Floaroma Town"] = {["Route 204_B"] = {{19, 41, 22, 41}}, ["Pokecenter Floaroma"] = {{25, 34}}, ["Mart Floaroma"] = {{36, 25}}, ["Route 205_A"] = {{45, 25, 45, 28}}, ["Floaroma Meadow_B"] = {{12, 4, 13, 4}}}
mapLink["Pokecenter Floaroma"] = {["Floaroma Town"]= {{7, 15, 8, 15}},["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Mart Floaroma"] = {["Floaroma Town"] = {{4, 11, 5, 11}}}
mapLink["Floaroma Meadow_B"] = {["Floaroma Town"] = {{15, 42, 16, 42}}}
-- These are downhill landing cells, not a reversible A/B doorway.
mapLink["Floaroma Meadow_A"] = {["Fuego Ironworks"] = {{56, 5, 57, 5}}, ["Floaroma Meadow_B"] = {{20, 23, 34, 23}}}
mapLink["Route 205_A"] = {["Floaroma Town"] = {{0, 105, 0, 108}}, ["Valley Windworks"] = {{39, 107, 39, 108}}, ["Eterna Forest"] = {{14, 28, 15, 28}}, ["Fuego Ironworks"] = {{0, 49, 0, 51}}}
mapLink["Route 205_B"] = {["Eterna City"] = {{64, 17, 64, 22}}, ["Eterna Forest"] = {{33, 10, 33, 11}}}
mapLink["Valley Windworks"] = {["Route 205_A"] = {{0, 71, 0, 72}}}
mapLink["Fuego Ironworks"] = {["Route 205_A"] = {{42, 28, 42, 30}}, ["Floaroma Meadow_A"] = {{22, 32, 23, 32}}}
mapLink["Eterna Forest"] = {["Route 205_A"] = {{21, 80, 22, 80}}, ["Route 205_B"] = {{78, 31, 78, 32}}}


---Eterna City
mapLink["Eterna City"] = {["Route 205_B"] = {{0, 19, 0, 24}}, ["Pokecenter Eterna City"] = {{17, 20}}, ["Mart Eterna City"] = {{22, 35}}, ["Route 211_A"] = {{66, 20, 66, 24}}, ["Eterna City Stop House"] = {{17, 56, 18, 56}}}
mapLink["Pokecenter Eterna City"] = {["Eterna City"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Mart Eterna City"] = {["Eterna City"] = {{4, 11, 5, 11}}}
mapLink["Eterna City Stop House"] = {["Eterna City"] = {{3, 2, 4, 2}}, ["Route 206_A"] = {{3, 12, 4, 12}}}
mapLink["Route 206_A"] = {["Eterna City Stop House"] = {17, 3, 19, 3}, ["Route 206 Stop House"] = {{15, 107, 17, 107}}, ["Wayward Cave"] = {{24, 33}}}
mapLink["Route 206 Stop House"] = {["Route 206_A"] = {{3, 2, 4, 2}}, ["Route 206_B"] = {{3, 12, 4, 12}}}
mapLink["Route 206_B"] = {["Route 207_B"] = {{16, 130, 19, 130}}, ["Route 206 Stop House"] = {15, 112, 17, 112}}
mapLink["Wayward Cave"] = {["Route 206_B"] = {{41, 46}}}
mapLink["Mt. Coronet South"] = {["Route 207_B"] = {{3, 9}}, ["Route 208"] = {{30, 18}}, ["Mt. Coronet 2F_A"] = {{28, 4}}}
mapLink["Mt. Coronet 2F_A"] = {["Mt. Coronet South"] = {{24, 26}}, ["Route 207_C"] = {{2, 34}}}
mapLink["Mt. Coronet 2F_B"] = {["Mt. Coronet 3F"] = {{46, 7}}}
mapLink["Mt. Coronet 2F_C"] = {["Mt. Coronet 3F"] = {{58, 7}}}
mapLink["Mt. Coronet 3F"] = {["Mt. Coronet 2F_B"] = {{24, 17}}, ["Mt. Coronet 2F_C"] = {{32, 17}}, ["Mt. Coronet Summit_A"]= {{13, 22}}}
mapLink["Mt. Coronet Summit_A"] = {["Mt. Coronet 3F"] = {{8, 54}}, ["Mt. Coronet 4F_A"] = {{7, 40}}, ["Mt. Coronet 4F_B"] = {{34, 41}}}
mapLink["Mt. Coronet 4F_A"] = {["Mt. Coronet Summit_A"] = {{11, 44}}, ["Mt. Coronet Summit_B"] = {{45, 29}}}
mapLink["Mt. Coronet 4F_B"] = {["Mt. Coronet Summit_A"] = {{39, 43}}}
mapLink["Mt. Coronet Summit_B"] = {["Mt. Coronet 4F_A"] = {{37, 28}}, ["Mt. Coronet 5F"] = {{11, 9}}, ["Mt. Coronet Tunnel"] = {{43, 16}}}
mapLink["Mt. Coronet 5F"] = {["Mt. Coronet 6F"] = {{16, 10}}, ["Mt. Coronet Summit_B"] = {{4, 6}}}
mapLink["Mt. Coronet 6F"] = {["Mt. Coronet 7F"] = {{5, 23}}, ["Mt. Coronet 5F"] = {{11, 9}}}
mapLink["Mt. Coronet 7F"] = {["Spear Pillar"] = {{18, 10}}, ["Mt. Coronet 6F"] = {{22, 27}}}
mapLink["Spear Pillar"] = {["Mt. Coronet 7F"] = {{11, 39}}}
mapLink["Mt. Coronet Tunnel"] = {["Mt. Coronet Summit_B"] = {{2, 49}}, ["Mt. Coronet Center"] = {{18, 14}}}
mapLink["Mt. Coronet Center"] = {["Mt. Coronet Tunnel"] = {{20, 47}}, ["Route 211_B"] = {{32, 23}}, ["Route 211_A"] = {{2, 28}}, ["Mt. Coronet B1F"] = {{12, 5}}}
mapLink["Route 211_A"] = {["Eterna City"] = {{0, 26, 0, 30}}, ["Mt. Coronet Center"] = {{37, 23}}}
mapLink["Route 211_B"] = {["Mt. Coronet Center"] = {{59, 21}}, ["Celestic Town"] = {{94, 19, 94, 23}}}
mapLink["Route 216"] = {["Mt. Coronet North"] = {{91, 18}}, ["Route 217"] = {{18, 0, 20, 0}}}
mapLink["Mt. Coronet North"] = {["Route 216"] = {{3, 5}}, ["Mt. Coronet B1F"] = {{10, 16}}}
mapLink["Mt. Coronet B1F"] = {["Mt. Coronet North"] = {{9, 4}}, ["Mt. Coronet Center"] = {{9, 54}}, ["Mt. Coronet B2F 2R"] = {1}}
mapLink["Route 217"] = {["Route 216"] = {{19, 114, 21, 114}}, ["Acuity Lakefront"] = {{33, 0, 35, 0}}}
mapLink["Acuity Lakefront"] = {["Route 217"] = {{21, 49, 23, 49}}, ["Lake Acuity"] = {{25, 18}}, ["Snowpoint City"] = {{70, 35, 70, 36}}}
mapLink["Lake Acuity"] = {["Route 218"] = {{11, 45}}}

---Snowpoint
mapLink["Snowpoint City"] = {["Pokecenter Snowpoint City"] = {{30, 37}}, ["Acuity Lakefront"] = {{0, 43, 0, 44}}, ["Mart Snowpoint City"] = {{4, 36}}}
mapLink["Pokecenter Snowpoint City"] = {["Snowpoint City"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Mart Snowpoint City"] = {["Snowpoint City"] = {{3, 11}}}

---Celestic
mapLink["Celestic Town"] = {["Celestic Pokecenter"] = {{22, 29}}, ["Route 211_B"] = {{0, 16, 0, 20}}, ["Route 210 North"] = {{30, 18, 30, 22}}}
mapLink["Celestic Pokecenter"] = {["Celestic Town"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Route 210 North"] = {["Celestic Town"] = {{0, 15, 0, 17}}, ["Cave Of Justice"] = {{67, 11}}, ["Route 210"] = {{100, 30, 103, 30}}}
mapLink["Cave Of Justice"] = {["Route 210 North"] = {{18, 31}}}
mapLink["Route 210"] = {["Route 210 North"] = {{27, 0, 30, 0}}, ["Route 215"] = {{40, 39, 40, 45}}, ["Solaceon Town"] = {{18, 87, 24, 87}}}

---Solaceon
mapLink["Solaceon Town"] = {["Route 210"] = {{15, 0, 21, 0}}, ["Solaceon Pokecenter"] = {{24, 16}}, ["Solaceon Pokemart"] = {{29, 27}}, ["Pokemon News Press"] = {{29, 15, 29, 16}}, ["Route 209"] = {{16, 35, 20, 35}}, ["Maniac Tunnel"] = {{53, 17}}}
mapLink["Solaceon Pokecenter"] = {["Solaceon Town"] = {{7, 11, 8, 11}}, ["Transmat Station Sinnoh"]={{1, 9}}}
mapLink["Solaceon Pokemart"] = {["Solaceon Town"] = {{5, 12, 6, 12}}}
mapLink["Maniac Tunnel"] = {["Solaceon Town"] = {{5, 8}}, ["Route 214"] = {{104, 8}}}
mapLink["Pokemon News Press"] = {["Solaceon Town"] = {{4, 8}}}
mapLink["Route 209"] = {["Solaceon Town"] = {{75, 0, 81, 0}}, ["Route 209 Stop House"] = {{3, 65, 3, 66}}}
mapLink["Route 209 Stop House"] = {["Route 209"] = {{10, 6, 10, 7}}, ["Hearthome City"] = {{0, 6, 0, 7}}}

---Hearthome
mapLink["Hearthome City"] = {["Hearthome Pokecenter"] = {{18, 16}}, ["Route 209 Stop House"] = {{58, 42, 58, 43}}, ["Mart Hearthome"] = {{30, 27}}, ["Amity Square Entrance 1"] = {{11, 3, 12, 3}}, ["Route 208 Stop House"] = {{5, 41, 5, 42}}, ["Hearthome City Stop House 2"]= {{10, 45, 11, 45}}}
mapLink["Hearthome Pokecenter"] = {["Hearthome City"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Mart Hearthome"] = {["Hearthome City"] = {{4, 11, 5, 11}}}
mapLink["Amity Square Entrance 1"] = {["Hearthome City"] = {{3, 12, 4, 12}}, ["Amity Square"] = {{3, 2, 4, 2}}}
mapLink["Amity Square"] = {["Amity Square Entrance 1"] = {{11, 52, 12, 52}}}
mapLink["Route 208 Stop House"] = {["Hearthome City"] = {{10, 6, 10, 7}}, ["Route 208"] = {{0, 6, 0, 7}}}
mapLink["Hearthome City Stop House 2"] = {["Hearthome City"] = {{3, 2, 4, 2}}, ["Route 212 North"] = {{3, 12, 4, 12}}}
mapLink["Route 208"] = {["Route 208 Stop House"] = {{67, 26, 67, 27}}, ["Mt. Coronet South"] = {{2, 25}}}
mapLink["Route 212 North"] = {["Hearthome City Stop House 2"] = {{10, 5, 11, 5}}, ["Route 212 South"] = {{9, 98, 14, 98}}}
mapLink["Route 212 South"] = {["Route 212 North"] = {{8, 0, 13, 0}}, ["Pastoria City"] = {{128, 12, 128, 16}}}

---Pastoria
mapLink["Pastoria City"] = {["Pastoria Pokecenter"] = {{24, 17}}, ["Pastoria Pokemart"] = {{25, 46}}, ["Route 212 South"] = {{0, 47, 0, 51}}, ["Sinnoh Safari Stop"] = {{34, 10, 35, 10}}, ["Pastoria City Stop House"] = {{60, 13, 60, 14}}}
mapLink["Pastoria Pokecenter"] = {["Pastoria City"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Pastoria Pokemart"] = {["Pastoria City"] = {{4, 11, 5, 11}}}
mapLink["Sinnoh Safari Stop"] = {["Pastoria City"] = {{5, 15, 8, 15}}}
mapLink["Sinnoh Safari Area Zone 2"] = {["Sinnoh Safari Stop"] = {{2, 28, 3, 28}}, ["Sinnoh Safari Area Zone 1"] = {{0, 24, 0, 27}}}
mapLink["Sinnoh Safari Area Zone 1"] = {["Sinnoh Safari Area Zone 2"] = {{35, 24, 35, 27}}, ["Sinnoh Safari Area Zone 4_A"] = {{14, 0, 15, 0}}, ["Sinnoh Safari Area Zone 4_B"] = {{28, 0, 31, 0}}, ["Sinnoh Safari Area Zone 3_A"] = {{8, 0, 27, 0}}}
mapLink["Sinnoh Safari Area Zone 4_A"] = {["Sinnoh Safari Area Zone 1"] = {{14, 30, 15, 30}}, ["Sinnoh Safari Area Zone 5"] = {{10, 0, 11, 0}}}
mapLink["Sinnoh Safari Area Zone 4_B"] = {["Sinnoh Safari Area Zone 1"] = {{28, 30, 31, 30}}, ["Sinnoh Safari Area Zone 3"] = {{33, 24, 33, 25}}}
mapLink["Sinnoh Safari Area Zone 4_C"] = {["Sinnoh Safari Area Zone 5"] = {{25, 0, 30, 0}}}
mapLink["Sinnoh Safari Area Zone 3_A"] = {["Sinnoh Safari Area Zone 4_B"] = {{2, 23, 2, 24}}, ["Sinnoh Safari Area Zone 1"] = {{8, 28, 27, 28}}}
mapLink["Sinnoh Safari Area Zone 3_B"] = {["Sinnoh Safari Area Zone 6"] = {{14, 0, 15, 0}}}
mapLink["Sinnoh Safari Area Zone 5"] = {["Sinnoh Safari Area Zone 4_A"] = {{10, 33, 11, 33}}, ["Sinnoh Safari Area Zone 4_C"] = {{25, 33, 30, 33}}, ["Sinnoh Safari Area Zone 6"] = {{33, 14, 33, 15}}}
mapLink["Sinnoh Safari Area Zone 6"] = {["Sinnoh Safari Area Zone 5"] = {{2, 14, 2, 15}}, ["Sinnoh Safari Area Zone 3_B"] = {{14, 32, 15, 32}}}
mapLink["Pastoria City Stop House"] = {["Pastoria City"] = {{0, 6, 0, 7}}, ["Route 213_A"] = {{10, 6, 10, 7}}}
mapLink["Route 213_A"] = {["Pastoria City Stop House"] = {{5, 17, 5, 18}}, ["Route 213 House 1"] = {{66, 22}}}
mapLink["Route 213_B"] = {["Route 213 House 1"] = {{5, 17, 5, 18}}, ["Valor Lakefront"] = {{58, 0, 68, 0}}}
mapLink["Route 213 House 1"] = {["Route 213_A"] = {{8, 12, 9, 12}}, ["Route 213_B"] = {{8, 3, 9, 3}}}
mapLink["Valor Lakefront"] = {["Route 213_B"] = {{25, 49, 42, 49}}, ["Route 214"] = {{54, 0, 58, 0}}, ["Route 222"] = {{61, 45, 61, 48}}, ["Lake Valor"] = {{40, 20, 40, 21}}}
mapLink["Lake Valor"] = {["Valor Lakefront"] = {{60, 5, 60, 6}}}
mapLink["Route 214"] = {["Valor Lakefront"] = {{25, 96, 29, 96}}, ["Sendoff Spring"] = {{35, 68, 35, 69}}, ["Route 214 Stop House"] = {{12, 4, 13, 4}}, ["Maniac Tunnel"] = {{4, 33}}}
mapLink["Sendoff Spring"] = {["Route 214"] = {{0, 44, 0, 45}}}
mapLink["Route 214 Stop House"] = {["Route 214"] = {{3, 12, 4, 12}}, ["Veilstone City"] = {{3, 2, 4, 2}}}


---Veilstone
mapLink["Veilstone City"] = {["Veilstone Pokecenter"] = {{46, 31}}, ["Veilstone Department Store"] = {{29, 25}}, ["Route 214 Stop House"] = {{47, 51, 48, 51}}, ["Route 215 Stop House"] = {{5, 23, 5, 24}}}
mapLink["Veilstone Pokecenter"] = {["Veilstone City"] = {{7, 11, 8, 11}}, ["Transmat Station Sinnoh"]={{1, 9}}}
--mapLink["Veilstone Department Store"] = {["Veilstone City"] = {1}}
mapLink["Route 215 Stop House"] = {["Veilstone City"] = {{10, 6, 10, 7}}, ["Route 215"] = {{0, 6, 0, 7}}}
mapLink["Route 215"] = {["Route 210"] = {{0, 20, 0, 26}}, ["Route 215 Stop House"] = {{119, 24, 119, 25}}}
mapLink["Route 222"] = {["Route 214"] = {{0, 18, 0, 21}}, ["Route 222 Stop House"] = {{107, 24, 107, 25}}}
mapLink["Route 222 Stop House"] = {["Route 222"] = {{0, 6, 0, 7}}, ["Sunyshore City"] = {{10, 6, 10, 7}}}

---Sunyshore
mapLink["Sunyshore City"] = {["Pokecenter Sunyshore"] = {{29, 48}}, ["Mart Sunyshore City"] = {{22, 32}}, ["Route 222 Stop House"] = {{1, 53, 1, 54}}, ["Route 223"] = {{13, 0, 30, 0}}}
mapLink["Pokecenter Sunyshore"] = {["Sunyshore City"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Mart Sunyshore City"] = {["Sunyshore City"] = {{4, 11, 5, 11}}}
mapLink["Route 223"] = {["Sunyshore City"] = {{18, 120, 35, 120}}, ["Pokemon League Sinnoh_A"] = {{12, 0, 32, 0}}}
mapLink["Pokemon League Sinnoh_A"] = {["Route 223"] = {{10, 90, 30, 90}}, ["Sinnoh Victory Road 1F_A"] = {{24, 72}}, ["Pokecenter League Pokemon Sinnoh"] = {{13, 73}}}
mapLink["Pokemon League Sinnoh_B"] = {["Sinnoh Victory Road 1F_A"] = {{29, 56}}, ["Sinnoh Pokemon League Grand Floor"] = {{20, 18}}}
mapLink["Sinnoh Pokemon League Grand Floor"] = {["Pokemon League Sinnoh_B"] = {{10, 28}}}
mapLink["Pokecenter League Pokemon Sinnoh"] = {["Pokemon League Sinnoh_A"] = {{7, 15, 8, 15}}}
mapLink["Sinnoh Victory Road 1F_A"] = {["Pokemon League Sinnoh_A"] = {{16, 73}}, ["Sinnoh Victory Road 2F_A"] = {{3, 32, 3, 33}}, ["Sinnoh Victory Road 2F_B"] = {{6, 42, 6, 43}}, ["Sinnoh Victory Road 2F_C"] = {{3, 21, 3, 22}}, ["Sinnoh Victory Road B1F_A"] = {{42, 22}}, ["Sinnoh Victory Road B1F_B"] = {{43, 38}}, ["Pokemon League Sinnoh_B"] = {{33, 4}}, ["Sinnoh Victory Road B1F Deep Entrance"] = {{46, 30}}}
mapLink["Sinnoh Victory Road 1F_B"] = {["Sinnoh Victory Road B1F_C"] = {{44, 45}}}
mapLink["Sinnoh Victory Road 2F_A"] = {["Sinnoh Victory Road 1F_A"] = {{25, 16}}}
mapLink["Sinnoh Victory Road 2F_B"] = {["Sinnoh Victory Road 1F_A"] = {{27, 26}}}
mapLink["Sinnoh Victory Road 2F_C"] = {["Sinnoh Victory Road 1F_A"] = {{25, 6}}}
mapLink["Sinnoh Victory Road B1F_A"] = {["Sinnoh Victory Road 1F_A"] = {{4, 16}}}
mapLink["Sinnoh Victory Road B1F_B"] = {["Sinnoh Victory Road 1F_A"] = {{6, 34}}}
mapLink["Sinnoh Victory Road B1F_C"] = {["Sinnoh Victory Road 1F_B"] = {{7, 39}}}
mapLink["Sinnoh Victory Road B1F Deep Entrance"] = {["Sinnoh Victory Road 1F_A"] = {{6, 24}}, ["Sinnoh Victory road B1F Deep"] = {{24, 17}}}
mapLink["Sinnoh Victory road B1F Deep"] = {["Sinnoh Victory Road B1F Deep Entrance"] = {{3, 59}}, ["Sinnoh Victory Road B1F Deep Exit"] = {{58, 18}}}
mapLink["Sinnoh Victory Road B1F Deep Exit"] = {["Sinnoh Victory road B1F Deep"] = {{11, 14}}, ["Route 224"] = {{29, 10}}}
mapLink["Route 224"] = {["Sinnoh Victory Road B1F Deep Exit"] = {{14, 75}}}

--- Fight Area
mapLink["Fight Area"] = {["Fight Area Pokecenter"] = {{36, 11}}, ["Route 225 Stop House"] = {{22, 4, 23, 4}}, ["Route 230"] = {{66, 13, 66, 15}}, ["Fight Area Pokemart"] = {{55, 11}}}
mapLink["Fight Area Pokecenter"] = {["Fight Area"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Fight Area Pokemart"] = {["Fight Area"] = {{4, 11}}}
mapLink["Route 225 Stop House"] = {["Fight Area"] = {{3, 12, 4, 12}}, ["Route 225"] = {{3, 2, 4, 2}}}
mapLink["Route 225"] = {["Route 225 Stop House"] = {{22, 85, 23, 85}}, ["Survival Area"] = {{31, 11, 31, 13}}}

--- Survival Area
mapLink["Survival Area"] = {["Route 225"] = {{0, 11, 0, 13}}, ["Pokecenter Survival Area"] = {{19, 17}}, ["Survival Area Pokemart"] = {{24, 16}}, ["Route 226"] = {{36, 15, 36, 18}}}
mapLink["Pokecenter Survival Area"] = {["Survival Area"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Survival Area Pokemart"] = {["Survival Area"] = {{4, 11}}}
mapLink["Route 226"] = {["Survival Area"] = {{0, 15, 0, 18}}, ["Route 227"] = {{75, 0, 82, 0}},["Route 226 Stop House"] = {{93, 10, 93, 12}}}
mapLink["Route 227"] = {["Route 226"] = {{16, 54, 23, 54}}, ["Stark Mountain Exterior Pt"] = {{20, 0, 26, 0}}}
mapLink["Stark Mountain Exterior Pt"] = {["Route 227"] = {{20, 26, 26, 26}}, ["Stark Mountain Entrance Pt"] = {{15, 5}}}
mapLink["Stark Mountain Entrance Pt"] = {["Stark Mountain Exterior Pt"] = {{20, 22}}, ["Stark Mountain Main Cavern Pt"] = {{17, 2}}}
mapLink["Stark Mountain Main Cavern Pt"] = {["Stark Mountain Entrance Pt"] = {{42, 57}}}
mapLink["Route 226 Stop House"] = {["Route 226"] = {{0, 6, 0, 7}}, ["Route 228"] = {{10, 6, 10, 7}}}
mapLink["Route 228"] = {["Route 226 Stop House"] = {{5, 10, 5, 11}}, ["Route 229"] = {{15, 89, 18, 89}}}
mapLink["Route 229"] = {["Route 228"] = {{17, 0, 19, 0}}, ["Resort Area"] = {{35, 30, 37, 30}}, ["Route 230"] = {{0, 20, 0, 21}}}

--- Resort Area
mapLink["Resort Area"] = {["Route 229"] = {{3, 0, 5, 0}}, ["Pokecenter Resort Area"] = {{3, 27}}}
mapLink["Pokecenter Resort Area"] = {["Resort Area"] = {{7, 15, 8, 15}}, ["Transmat Station Sinnoh"]={S_TELE}}
mapLink["Route 230"] = {["Route 229"] = {{100, 16, 100, 17}}, ["Fight Area"] = {{0, 16, 0, 18}}}
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- Pinkan --------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
mapLink["Pokecenter Pinkan City"] = {["Pinkan City"] = {{7,22,9,22}}}
mapLink["Pinkan Island Forest"] = {["Pinkan City"] = {{34,0,38,0}}, ["Pinkan Island Meadow"] = {{0,9,0,13}}}
mapLink["Pinkan Island Meadow"] = {["Pinkan Island Forest"] = {{77,9,77,13}}}
mapLink["Pinkan City"] = {["Pinkan Island Forest"] = {{34, 60, 38, 60}}, ["Pokecenter Pinkan City"] = {{36, 32}}, ["Pokemart Pinkan City"] = {{46, 23}}, ["Pinkan Island Peaks"] = {{66, 14}}, ["Pinkan Lighthouse 1F"]= {{19, 13}}}
mapLink["Pokemart Pinkan City"] = {["Pinkan City"] = {{4, 11}}}
mapLink["Pinkan Island Forest"] = {["Pinkan City"] = {{34, 0, 38, 0}}, ["Pinkan Island Meadow_A"] = {{0, 9, 0, 13}}, ["Pinkan Island Cliff"] = {{62, 55, 66, 55}}, ["Pinkan Island Cave_A"] = {{57, 14}}}
mapLink["Pinkan Island Cliff"] = {["Pinkan Island Forest"] = {{44, 1, 45, 1}}}
mapLink["Pinkan Island Meadow_A"] = {["Pinkan Island Forest"] = {{77, 9, 77, 13}}, ["Pinkan Island Meadow Tunnel"] = {{38, 11}}}
mapLink["Pinkan Island Meadow Tunnel"] = {["Pinkan Island Meadow_A"] = {{19, 8}}, ["Pinkan Island Meadow_B"] = {{1, 12}}}
mapLink["Pinkan Island Meadow_B"] = {["Pinkan Island Meadow Tunnel"] = {{30, 16}}}
mapLink["Pinkan Island Cave_A"] = {["Pinkan Island Forest"] = {{46, 52}}, ["Pinkan Island Cave_B"] = {{47, 40}}}
mapLink["Pinkan Island Cave_B"] = {["Pinkan Island Path"] = {{36, 3}}}
mapLink["Pinkan Island Path"] = {["Pinkan Island Cave_B"] = {{56, 34}}, ["Pinkan Island Woodlands"] = {{35, 0, 36, 0}}}
mapLink["Pinkan Island Island Woodlans East"] = {["Pinkan Island Woodlands"] = {{0, 12, 0, 14}}}
mapLink["Pinkan Island Island Woodlans West"] = {["Pinkan Island Woodlands"] = {{53, 28, 53, 30}}}
mapLink["Pinkan Island Woodlands"] = {["Pinkan Island Path"] = {{35, 35, 36, 35}}, ["Pinkan Island Island Woodlans East"] = {{65, 12, 65, 14}}, ["Pinkan Island Island Woodlans West"] = {{0, 7, 0, 9}}, ["Pinkan Island Woodlands Clearing"] = {{29, 0, 30, 0}}}
mapLink["Pinkan Island Woodlands Clearing"] = {["Pinkan Island Woodlands"] = {{29, 34, 30, 34}}, ["Pinkan Island Vale"] = {{20, 0, 22, 0}}}
mapLink["Pinkan Island Vale"] = {["Pinkan Island Woodlans Clearing"] = {{20, 55, 22, 55}}, ["Pinkan Island Mountains"] = {{28, 0, 30, 0}}}
mapLink["Pinkan Island Mountains"] = {["Pinkan Island Vale"] = {{28, 58, 30, 58}}, ["Pinkan Island Peaks"] = {{33, 0, 35, 0}}}
mapLink["Pinkan Island Peaks"] = {["Pinkan Island Mountains"] = {{14, 38, 16, 38}}, ["Pinkan City"] = {{5, 33}}}
mapLink["Pinkan Lighthouse 1F"] = {["Pinkan City"] = {{7, 14, 8, 14}}, ["Pinkan Lighthouse Elevator"] = {{8, 1}}}
mapLink["Pinkan Lighthouse Elevator"] = {["Pinkan Lighthouse 1F"] = {{2, 5, 3, 5}}, ["Pinkan Lighthouse 2F"] = {1}}

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- Matsuki Village (Keldeo,Cobalion,Terrakion) ------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
mapLink["Matsuki Village"] = {["Matsuki Castle"] = {{27, 15}}, ["Wastelands"] = {{100, 68, 100, 72}}, ["Pokecenter Matsuki Village"] = {{56, 51}}}
mapLink["Pokecenter Matsuki Village"] = {["Matsuki Village"] = {{4, 23}}}
mapLink["Matsuki Castle"] = {["Matsuki Village"] = {{13, 100, 15, 100}}, ["Matsuki Courtyard"] = {{46, 46, 47, 46}}}
mapLink["Matsuki Courtyard"] = {["Matsuki Castle"] = {{5, 33, 6, 33}}, ["Crystal Cavern"] = {{5, 2}}}
mapLink["Crystal Cavern"] = {["Matsuki Courtyard"] = {{73, 95}}}
mapLink["Wastelands"] = {["Matsuki Village"] = {{0, 25, 0, 29}}, ["Forest Dungeon Entrance"] = {{65, 0, 69, 0}}, ["Mountain Area Dungeon"] = {{110, 59, 110, 61}}}
mapLink["Forest Dungeon Entrance"] = {["Forest Maze"] = {{15, 0, 19, 0}}, ["Wastelands"] = {{16, 40, 19, 40}}}
mapLink["Forest Maze"] = {["Forest Maze Underground"] = {{28, 96}}, ["Forest Dungeon Entrance"] = {{23, 150, 27, 150}}}
mapLink["Forest Maze Underground"] = {["Forest Maze"] = {{17, 15}}}
mapLink["Mountain Area Dungeon"] = {["Wastelands"] = {{0, 45, 0, 47}}, ["Mountain Area Maze"] = {{54, 80}}}
mapLink["Mountain Area Maze"] = {["Mountain Area Dungeon"] = {{150, 62}}}
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- Crater Town --------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
mapLink["Crater Town Shore"] = {["Slateport City"] = {{6, 5}}, ["Crater Town"] = {{19, 35, 21, 35}}}
mapLink["Crater Town Pokecenter"] = {["Crater Town"] = {{11, 24, 12, 24}}}
mapLink["Crater Town Tunnel"] = {["Crater Town"] = {{12, 32}}}
mapLink["Crater Town"] = {["Crater Town Shore"] = {{19, 0, 21, 0}}, ["Crater Town Pokecenter"] = {{68, 6}}, ["Crater Town Tunnel"] = {{23, 8}}}

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- Halloween --------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
mapLink["Murky Town Ferry"] = {["Murky Town"] = {{7, 2, 8, 2}}}
mapLink["Murky Town"] = {["Pokecenter Murky Town"] ={{8, 8}}, ["Murky Town Ferry"] = {{12, 46, 13, 46}}, ["Murky Path"] = {{0, 15, 0, 16}}, ["Ghoul Swamp"] = {{31, 0, 33, 0}}}
mapLink["Pokecenter Murky Town"] = {["Murky Town"] = {{7, 22, 9, 22}}}
mapLink["Ghoul Swamp"] = {["Murky Town"] = {{31, 62, 33, 62}}, ["Unison Mountain South Summit"] = {{30, 3, 32, 3}}}
mapLink["Unison Mountain South Summit"] = {["Ghoul Swamp"] = {{31, 69, 33, 69}}, ["Pokecenter Unison Mountain"] = {{38, 32}}, ["Unison Mountain 3F_A"] = {{22, 24}}, ["Unison Mountain 1F"] = {{41, 67}}, ["Unison Mountain 3F_C"] = {{38, 7}}}
mapLink["Pokecenter Unison Mountain"] = {["Unison Mountain South Summit"] = {{7, 22, 9, 22}}}
mapLink["Unison Mountain 1F"] = {["Unison Mountain South Summit"] = {{6, 26}}, ["Unison Mountain 2F"] = {{14, 4}}}
mapLink["Unison Mountain 2F"] = {["Unison Mountain 1F"] = {{6, 5}}, ["Unison Mountain East Summit"] = {{36, 7}}}
mapLink["Unison Mountain East Summit"] = {["Unison Mountain 2F"] = {{8, 15}}, ["Howling Woods"] = {{48, 17, 48, 19}}}
mapLink["Howling Woods"] = {["Unison Mountain East Summit"] = {{0, 13, 0, 15}}, ["Dreadtown"] = {{86, 35, 86, 39}}}
mapLink["Unison Mountain 3F_A"] = {["Unison Mountain South Summit"] = {{24, 72}}, ["Angel Hill"] = {{4, 62}}}
mapLink["Unison Mountain 3F_B"] = {["Sweetsland_A"] = {{8, 24}}}
mapLink["Unison Mountain 3F_C"] = {["Unison Mountain South Summit"] = {{67, 76}}}
mapLink["Sweetsland_A"] = {["Unison Mountain 3F_B"] = {{12, 48}}, ["Bittersweet Cave 1F_A"] = {{7, 60}}, ["Bittersweet Cave 2F_A"] = {{22, 40}}, ["Bittersweet Cave 2F_B"] = {{28, 37}}, ["Bittersweet Cave 2F_C"] = {{33, 40}}}
mapLink["Sweetsland_B"] = {["Bittersweet Cave 2F_A"] = {{10, 38}}}
mapLink["Sweetsland_C"] = {["Bittersweet Cave 2F_B"] = {{43, 36}}, ["Pokecenter Sweetsland"] = {{31, 16}}, ["Bittersweet Cave 4F"] = {{37, 11}}, ["Sweetsland Pokemart"] = {{38, 38}}}
mapLink["Sweetsland_D"] = {["Bittersweet Cave 3F"] = {{43, 26}}}
mapLink["Sweetsland_E"] = {["Bittersweet Cave 1F_B"] = {{10, 7}}, ["Unison Mountain Summit_A"] = {{20, 0, 21, 0}}}
mapLink["Pokecenter Sweetsland"] = {["Sweetsland_C"] = {{13, 26}}}
mapLink["Sweetsland Pokemart"] = {["Sweetsland_C"] = {{10, 15}}}
mapLink["Bittersweet Cave 1F_A"] = {["Sweetsland_A"] = {{10, 76}}}
mapLink["Bittersweet Cave 1F_B"] = {["Bittersweet Cave 3F"] = {{64, 52}}, ["Sweetsland_E"] = {{26, 24}}}
mapLink["Bittersweet Cave 2F_A"] = {["Sweetsland_A"] = {{14, 6}}, ["Sweetsland_B"] = {{6, 9}}}
mapLink["Bittersweet Cave 2F_B"] = {["Sweetsland_A"] = {{44, 47}}, ["Sweetsland_C"] = {{53, 40}}}
mapLink["Bittersweet Cave 2F_C"] = {["Sweetsland_A"] = {{51, 54}}}
mapLink["Bittersweet Cave 3F"] = {["Bittersweet Cave 4F"] = {{9, 12}}, ["Bittersweet Cave 1F_B"] = {{22, 9}}, ["Sweetsland_D"] = {{40, 13}}}
mapLink["Bittersweet Cave 4F"] = {["Sweetsland_C"] = {{10, 13}}, ["Bittersweet Cave 3F"] = {{7, 6}}}
mapLink["Unison Mountain Summit_A"] = {["Sweetsland_E"] = {{27, 29, 29, 29}}}



mapLink["Murky Path"] = {["Murky Town"] = {{30, 7, 30, 8}}, ["Bone Pass"] = {{0, 8, 0, 9}}}
mapLink["Bone Pass"] = {["Murky Path"] = {{30, 8, 30, 9}}, ["Road Of Night"] = {{14, 23, 16, 23}}, ["Sacred Forest"] = {{0, 5}}}
mapLink["Sacred Forest"] = {["Bone Pass"] = {{50, 5}}, ["Haunted house 1F"] = {{24, 19}}}
mapLink["Haunted house 1F"] = {["Haunted house 2F"] = {{2, 12}}, ["Sacred Forest"] = {{9, 13}}}
mapLink["Haunted house 2F"] = {["Haunted house 1F"] = {{16, 13}}, ["Haunted house 3F"] = {{2, 3}}}
mapLink["Haunted house 3F"] = {["Haunted house 2F"] = {{15, 4}}}
mapLink["Road Of Night"] = {["Bone Pass"] = {{11, 0, 13, 0}}, ["Lost Seacoast"] = {{13, 34, 14, 35}}}
mapLink["Lost Seacoast"] = {["Road Of Night"] = {{13, 0, 14, 0}}, ["Festival Town"] = {{0, 26, 0, 29}}}


mapLink["Spooky Path"] = {["Dreadtown Vlads House"] = {{9, 35, 11, 35}}, ["Uncanny Path"] = {{9, 1}}}
mapLink["Dreadtown Vlads House"] = {["Dreadtown"] = {{21, 50}}, ["Spooky Path"]= {{27, 7}}}
mapLink["Pokecenter Dreadtown"] = {["Dreadtown"] = {{7, 22, 9, 22}}}
mapLink["Dreadtown"] = {["Pokecenter Dreadtown"] = {{37, 32}}, ["Mart Dreadtown"] = {{18, 22}},["Dreadtown Vlads House"] = {{33, 7}}, ["Howling Woods"] = {{0, 51, 0, 55}}}
mapLink["Mart Dreadtown"] = {["Dreadtown"] = {{3, 11}}}
mapLink["Uncanny Path"] = {["Necropolis"] = {{8, 0, 11, 0}}, ["Spooky Path"] = {{13, 37}}}
mapLink["Necropolis"] = {["Uncanny Path"] = {{18, 60, 21, 60}}, ["Dark Valley"] = {{19, 0, 21, 0}}, ["Pokecenter Necropolis"] ={{27, 39}}}
mapLink["Pokecenter Necropolis"] = {["Necropolis"] = {{7, 22, 9, 22}}}
mapLink["Dark Valley"] = {["Necropolis"] = {{7, 60, 9, 60}}}


mapLink["Serenia Village"] = {["Angel Hill"] = {{89, 34, 89, 38}}, ["Pokecenter Serenia Village"] = {{56, 20}}, ["Serenia Village Tunnel"] = {{37, 12}}}
mapLink["Pokecenter Serenia Village"] = {["Serenia Village"] = {{7, 22, 9, 22}}}
mapLink["Angel Hill"] = {["Unison Mountain 3F_A"] = {{88, 4}}, ["Serenia Village"] = {{0, 34, 0, 38}}}
mapLink["Serenia Village Tunnel"] = {["Serenia Village"] = {{6, 16}}, ["Unholy Sands South"] = {{18, 2}}}
mapLink["Unholy Sands South"] = {["Serenia Village Tunnel"] = {{22, 59}}, ["Unholy Sands"] = {{17, 0, 21, 0}}}
mapLink["Unholy Sands"] = {["Unholy Sands South"] = {{13, 80, 17, 80}}, ["Unholy Sands West"] = {{0, 45}}}
mapLink["Unholy Sands West"] = {["Unholy Sands"] = {{80, 27}}}

mapLink["Festival Town"] = {["Pokecenter Festival Town"] ={{19, 23}}, ["Mart Festival Town"] ={{27, 19}},["Lost Seacoast"] = {{67, 25, 67, 28}}, ["Cemetery Island_A"] = {{15, 39, 20, 39}}, ["Cemetery Island_B"] = {{39, 39, 42, 39}}, ["Illusory Forest"] = {{0, 14, 0, 15}}}
mapLink["Pokecenter Festival Town"] = {["Festival Town"] = {{7, 11, 8, 11}}}
mapLink["Mart Festival Town"] = {["Festival Town"] = {{4, 11}}}
mapLink["Illusory Forest"] = {["Festival Town"] = {{32, 14, 32, 15}}}
mapLink["Cemetery Island Ferry"] = {["Cemetery Island_B"] = {{7, 2, 8, 2}}}
mapLink["Cemetery Island_A"] = {["Festival Town"] = {{3, 0, 8, 0}}, ["Haunted Cave_A"] = {{18, 22}}}
mapLink["Cemetery Island_B"] = {["Festival Town"] = {{27, 0, 30, 0}}, ["Haunted Cave_B"] = {{58, 66}}, ["Cemetery Island Ferry"] = {{71, 72, 72, 72}}, ["Memorial Tower 1F"] = {{50, 31}}}
mapLink["Haunted Cave_A"] = {["Cemetery Island_A"] = {{3, 12}}}
mapLink["Haunted Cave_B"] = {["Cemetery Island_B"] = {{44, 64}}}
mapLink["Memorial Tower 1F"] = {["Cemetery Island_B"] = {{7, 13}}, ["Memorial Tower 2F"] = {{4, 3}}}
mapLink["Memorial Tower 2F"] = {["Memorial Tower 1F"] = {{10, 4}}}


-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- Summer --------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
mapLink["Kalijodo Path"] = {["Kalijodo Lake"] = {{68, 0, 70, 0}}, ["Vulcanic Town"] = {{0, 30, 0, 33}}}
mapLink["Kalijodo Cave B1F"] = {["Kalijodo Cave Entrance"] = {{5, 5}}, ["Kalijodo Cave B2F"] = {{42, 6}}}
mapLink["Kalijodo Cave B2F"] = {["Kalijodo Cave B1F"] = {{45, 4}}}
mapLink["Kalijodo Cave Entrance"] = {["Kalijodo Lake"] = {{5, 9}}, ["Kalijodo Cave B1F"] = {{5, 5}}}
mapLink["Kalijodo Lake"] = {["Kalijodo Path"] = {{29, 53, 31, 53}}, ["Kalijodo Cave Entrance"] = {{30, 26}}}

mapLink["Vulcanic Town"] = {["Pokecenter Vulcanic Town"] = {{26, 17}}, ["Vulcan Forest"] = {{16, 50, 18, 50}}, ["Kalijodo Path"] = {{70, 15, 70, 18}}, ["Pokemart Vulcanic Town"] = {{41, 35}}, ["Vulcan Cavern_A"] = {{24, 7}}}
mapLink["Pokecenter Vulcanic Town"] = {["Vulcanic Town"] = {{7, 22, 9, 22}}}
mapLink["Pokemart Vulcanic Town"] = {["Vulcanic Town"] = {{4, 11}}}

mapLink["Vulcan Cavern_A"] = {["Vulcanic Town"] = {{72, 79}}, ["Vulcan Cavern Cave"] = {{31, 74}}}
mapLink["Vulcan Cavern Cave"] = {["Vulcan Cavern_B"] = {{39, 19}}, ["Vulcan Cavern_A"] = {{21, 77}}} --
mapLink["Vulcan Cavern_B"] = {["Vulcan Lava Pit"] = {{33, 13, 39, 13}}, ["Vulcan Cavern Cave"] = {{53, 26}}}
mapLink["Vulcan Lava Pit"] = {["Vulcan Cavern_B"] = {{49, 76, 55, 76}}}

mapLink["Vulcan Island Shore"] = {["Vulcan Path"] = {{27, 0, 30, 0}}, ["Alto Mare Shore"] = {{1, 21, 1, 23}}, ["Vulcan Cove"] = {{65, 8, 65, 10}}}
mapLink["Vulcan Path"] = {["Vulcan Forest"] = {{50, 20, 50, 21}}, ["Vulcan Island Shore"] = {{20, 50, 23, 50}}}
mapLink["Vulcan Forest"] = {["Vulcan Path"] = {{0, 65, 0, 66}}, ["Vulcanic Town"] = {{18, 0, 20, 0}}, ["Mt. Summer Exterior 2"] = {{0, 27, 0, 29}}}

mapLink["Mt. Summer Exterior 2"] = {["Vulcan Forest"] = {{51, 57, 51, 59}}, ["Mt. Summer 1F 2"] = {{46, 3}}}
mapLink["Mt. Summer 1F 2"] = {["Mt. Summer Exterior 2"] = {{54, 38}}, ["Mt. Summer 2F 2"] = {{3, 3}}}
mapLink["Mt. Summer 2F 2"] = {["Mt. Summer 1F 2"] = {{5, 5}}, ["Mt. Summer 3F 2"] = {{53, 4}}}
mapLink["Mt. Summer 3F 2"] = {["Mt. Summer 2F 2"] = {{45, 11}}, ["Mt. Summer 4F 2"] = {{27, 16}}}
mapLink["Mt. Summer 4F 2"] = {["Mt. Summer 3F 2"] = {{22, 20}}}

mapLink["Alto Mare Shore"] = {["Vulcan Island Shore"] = {{43, 8, 43, 10}}, ["Alto Mare"] = {{7, 5, 7, 9}}}
mapLink["Alto Mare"] = {["Alto Mare Shore"] = {{86, 41, 86, 45}}, ["Pokecenter Alto Mare"] = {{11, 40}}, ["Alto Mare Pokemart"] = {{9, 31}}, ["Alto Mare East Avenue"] = {{67, 0, 68, 0}}, ["Alto Mare West Avenue"] = {{18, 0, 19, 0}}}
mapLink["Pokecenter Alto Mare"] = {["Alto Mare"] = {{20, 29, 21, 29}}}
mapLink["Alto Mare Pokemart"] = {["Alto Mare"] = {{9, 20}}}
mapLink["Alto Mare East Avenue"] = {["Alto Mare"] = {{6, 36, 8, 36}}, ["Alto Mare National Park"] = {{6, 5, 8, 5}}} -- 2 map chung diem di từ Alto mare -> alto mare national park
mapLink["Alto Mare West Avenue"] = {["Alto Mare"] = {{17, 37, 20, 37}}, ["Alto Mare National Park"] = {{15, 3, 16, 3}}} --
mapLink["Alto Mare National Park"] = {["Alto Mare East Avenue"] = {{61, 40, 63, 40}}, ["Alto Mare West Avenue"] = {{15, 40, 16, 40}}}

mapLink["Vulcan Cove"] = {["Vulcan Island Shore"] = {{0, 14, 0, 16}}, ["Vulcan Cave B1F"] = {{36, 60, 37, 60}}, ["Vulcan Plaza"] = {{86, 45, 86, 47}}}
mapLink["Vulcan Plaza"] = {["Vulcan Cove"] = {{0, 24, 0, 26}}, ["Vulcan Plaza Pokecenter"] = {{14, 22}}, ["Vulcan Plaza Pokemart"] = {{41, 21}}, ["Vulcan Fair"] = {{48, 12, 48, 13}}}
mapLink["Vulcan Plaza Pokecenter"] = {["Vulcan Plaza"] = {{12, 24}}}
mapLink["Vulcan Plaza Pokemart"] = {["Vulcan Plaza"] = {{9, 18}}}
mapLink["Vulcan Fair"] = {["Vulcan Plaza"] = {{0, 21, 0, 22}}}

mapLink["Vulcan Cave B1F"] = {["Vulcan Cove"] = {{6, 22}}, ["Vulcan Cave B2F"] = {{61, 30}}}
mapLink["Vulcan Cave B2F"] = {["Vulcan Cave B1F"] = {{26, 23}}}

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- SUBWAY --------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--mapLink["Transmat Station"] = {["Pokecenter Verdanturf"] = {H_SUBWAY}, ["Pokecenter Sootopolis City"] = {H_SUBWAY}, ["Pokecenter Slateport"] = {H_SUBWAY}, ["Pokecenter Rustboro City"] = {H_SUBWAY}, ["Pokecenter Petalburg City"] = {H_SUBWAY}, ["Pokecenter Pacifidlog Town"] = {H_SUBWAY}, ["Pokecenter Oldale Town"] = {H_SUBWAY}, ["Pokecenter Mossdeep City"] = {H_SUBWAY}, ["Pokecenter Mauville City"] = {H_SUBWAY}, ["Pokecenter Lilycove City"] = {H_SUBWAY}, ["Pokecenter Lavaridge Town"] = {H_SUBWAY}, ["Pokecenter Fortree City"] = {H_SUBWAY}, ["Pokecenter Fallarbor Town"] = {H_SUBWAY}, ["Pokecenter Ever Grande City"] = {H_SUBWAY}, ["Pokecenter Dewford Town"] = {H_SUBWAY}}

--mapLink["Vermilion City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Pokecenter Vermilion"] = {0.2}, ["Cerulean City Subway"] = {K_SUBWAY}}
--mapLink["Cherrygrove City Subway"] = {["Azalea Town Subway"] = {K_SUBWAY}, ["Mahogany Town Subway"] = {K_SUBWAY}, ["Blackthorn City Subway"] = {K_SUBWAY}, ["Olivine City Subway"] = {K_SUBWAY}, ["Goldenrod City Subway"] = {K_SUBWAY}, ["Violet City Subway"] = {K_SUBWAY}}


-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- Nap Island --------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

mapLink["Nap Shore"] = {["Route 49"] = {{35, 0, 38, 0}}, ["Nap Town"] = {{0, 20, 0, 23}}, ["Nap Forest"] = {{31, 26, 33, 26}}}
mapLink["Nap Forest"] = {["Nap Shore"] = {{24, 0, 26, 0}}}
mapLink["Nap Town"] = {["Nap Shore"] = {{52, 2, 52, 5}}, ["Pokecenter Nap Town"] = {{23, 7}}, ["Nap Town Mart"] = {{17, 28}}, ["Sleeping Path"] = {{0, 39, 0, 43}}, ["Route 135"] = {{9, 63, 14, 63}}}
mapLink["Pokecenter Nap Town"] = {["Nap Town"] = {{7, 20, 8, 20}}}
mapLink["Nap Town Mart"] = {["Nap Town"] = {{3, 11}}}
mapLink["Sleeping Path"] = {["Nap Town"] = {{52, 9, 52, 14}}, ["Nap Cave_A"] = {{38, 4}}}

mapLink["Nap Cave B1F"] = {["Nap Cave_A"] = {{5, 13}}, ["Nap Cave_B"] = {{97, 6}}}
mapLink["Nap Cave_A"] = {["Nap Cave B1F"] = {{8, 30}}, ["Sleeping Path"] = {{22, 53}}}
mapLink["Nap Cave_B"] = {["Nap Cave B1F"] = {{50, 19}}, ["Secret Nap Area"] = {{43, 4}}}
mapLink["Secret Nap Area"] = {["Nap Cave_B"] = {{24, 42}}}


-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------- Eumi Island--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
mapLink["Eumi Island Town"] = {["Eindoak Waterway"] = {1}, ["Lilycove City Harbor"] = {{29, 31}}, ["Eumi Island Pokecenter"] = {{15, 17}}, ["Eumi Island Temple Entrance"] = {{0, 9, 0, 13}}, ["Eumi Island Theme Park 1"] = {{23, 0, 29, 0}}}
mapLink["Eumi Island Pokecenter"] = {["Eumi Island Town"] = {{7, 17, 8, 17}}}
mapLink["Eumi Island Temple Entrance"] = {["Eumi Island Town"] = {{7, 17, 8, 17}}}
mapLink["Eumi Island Park Shop"] = {["Eumi Island Theme Park 1"] = {{4, 11}}}
mapLink["Eumi Island Theme Park 3"] = {["Eumi Island Theme Park 1"] = {{0, 17, 0, 19}}}
mapLink["Eumi Island Theme Park 1"] = {["Eumi Island Town"] = {{23, 40, 29, 40}}, ["Eumi Island Park Shop"] = {{20, 9}}, ["Eumi Island Theme Park 2"] = {{0, 11, 0, 14}}, ["Eumi Island Theme Park 3"] = {{51, 17, 51, 19}}}
mapLink["Eumi Island Theme Park 2"] = {["Eumi Island Theme Park 1"] = {{51, 11, 51, 14}}, ["Eumi Island Burned Tower"] = {{35, 24}}}
mapLink["Eumi Island Burned Tower"] = {["Eumi Island Theme Park 2"] = {{19, 31, 20, 31}}}

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------Eindoak Waterway---------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
mapLink["Eindoak Waterway"] = {["Galeras Island South"] = {{30, 0, 35, 0}}, ["Enyor Island Forest"] = {{200, 5, 200, 10}}, ["Eindoak Town"] = {{99, 95, 101, 95}}}
mapLink["Galeras Island South"] = {["Galeras Island East"] = {{108, 0, 109, 0}}, ["Galeras Island West"] = {{16, 0, 19, 0}}, ["Eindoak Waterway"] = {{58, 80, 63, 80}}}
mapLink["Galeras Island East"] = {["Galeras Island South"] = {{48, 100, 50, 100}}}
mapLink["Galeras Island West"] = {["Galeras Island South"] = {{57, 100, 60, 100}}}
mapLink["Enyor Island Forest"] = {["Eindoak Waterway"] = {{0, 30, 0, 35}}}
mapLink["Eindoak Town"] = {["Eindoak Town Pokecenter"] = {{13, 27}}, ["Eindoak Town Pokemart"] = {{32, 36}}, ["Eindoak Waterway"] = {{13, 0, 15, 0}}, ["Dragonspiral Tower Exterior"] = {{65, 27, 65, 30}}}
mapLink["Eindoak Town Pokecenter"] = {["Eindoak Town"] = {{8, 20, 9, 20}}}
mapLink["Eindoak Town Pokemart"] = {["Eindoak Town"] = {7, 10, 8, 10}}
mapLink["Dragonspiral Tower Exterior"] = {["Eindoak Town"] = {{0, 58, 0, 61}}, ["Dragonspiral Tower Entry"] = {{22, 23}}}
mapLink["Dragonspiral Tower Entry"] = {["Dragonspiral Tower Exterior"] = {{9, 22}}, ["Dragonspiral Tower 1F"] = {{1}}}
mapLink["Dragonspiral Tower 1F"] = {["Dragonspiral Tower Entry"] = {{16, 42}}, ["Dragonspiral Tower 2F"] = {{26, 7, 28, 7}}}
mapLink["Dragonspiral Tower 2F"] = {["Dragonspiral Tower 1F"] = {{20, 39, 21, 39}}, ["Dragonspiral Tower 3F"] = {{5, 26, 5, 28}}}
mapLink["Dragonspiral Tower 3F"] = {["Dragonspiral Tower 2F"] = {{37, 40, 38, 40}}, ["Dragonspiral Tower 4F"] = {{21, 0, 22, 0}}}
mapLink["Dragonspiral Tower 4F"] = {["Dragonspiral Tower 3F"] = {{51, 34, 51, 35}}}


-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------Love Island---------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
mapLink["Love Island_A"] = {["Diamond Domain 1F_A"] = {{18, 35}}, ["Love Island Ferry"] = {{47, 109, 48, 109}}, ["Pokecenter Love Island"] = {{4, 11}}, ["Love Island House 1"] = {{31, 40}}}
mapLink["Love Island_B"] = {["Diamond Domain 1F_B"] = {{21, 21}}}
mapLink["Pokecenter Love Island"] = {["Love Island_A"] = {{7, 22, 9, 22}}}
mapLink["Love Island House 1"] = {["Love Island_A"] = {{4, 11}}}
mapLink["Love Island Ferry"] = {["Love Island_A"] = {{7, 2, 8, 2}}}
mapLink["Diamond Domain 1F_A"] = {["Love Island_A"] = {{24, 53}}}
mapLink["Diamond Domain 1F_B"] = {["Diamond Domain B1F"] = {{37, 39}}, ["Love Island_B"] = {{30, 21}}}
mapLink["Diamond Domain B1F"] = {["Diamond Domain 1F_B"] = {{39, 38}}, ["Diamond Domain Main Cave"] = {{55, 13}}}
mapLink["Diamond Domain Main Cave"] = {["Diamond Domain B1F"] = {{26, 35}}, ["Diamond Empire Pathway Underwater"] = {{28, 5}}}
mapLink["Diamond Empire Pathway Underwater"] = {["Diamond Domain Main Cave"] = {{21, 50}}, ["Diamond Empire Entry"] = {{20, 10}}}
mapLink["Diamond Empire Entry"] = {["Diamond Empire Pathway Underwater"] = {{7, 22}}, ["Diamond Empire Foyer"] = {{26, 5}}}
mapLink["Diamond Empire Foyer"] = {["Diamond Empire Entry"] = {{18, 21}}}

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------Dock Island---------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
mapLink["Desert Cave"] = {["Abandoned Desert Village"] = {{7, 4}}, ["Amazon Forest"] = {{7, 20}}}
mapLink["Desert Lagoon"] = {["Abandoned Desert Village"] = {{31, 50, 33, 50}}}
mapLink["Abandoned Desert Village"] = {["Desert Cave"] = {{20, 30}}, ["Desert Lagoon"] = {{19, 0, 21, 0}}}
mapLink["Dock Island"] = {["Amazon Forest Entrance"] = {{22, 0, 24, 0}}, ["Dock Island House 2"] = {{2, 11}}}
mapLink["Amazon Forest Entrance"] = {["Dock Island"] = {{15, 25, 17, 25}}, ["Amazon Forest"] = {{11, 0, 13, 0}}}
mapLink["Amazon Forest"] = {["Amazon Forest Entrance"] = {{25, 35, 27, 35}}, ["Desert Cave"] = {{38, 5}}}
mapLink["Dock Island House 2"] = {["Dock Island"] = {{5, 11}}}
return mapLink
