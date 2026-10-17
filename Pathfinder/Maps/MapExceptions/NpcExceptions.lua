return function()

local npcExce = {}

----------------------
------ KANTO ---------
----------------------
npcExce["Cinnabar Island"] = {
    ["Route 19_A"] = {{18, 30}, 1, ""}
}

npcExce["Route 19_A"] = {
    ["Cinnabar Island"] = {{20, 28}, 1, ""}
}

npcExce["Love Island Ferry"] = {
    ["Pokecenter Vermilion"] = {{7, 8}, 1, "Ahoy, there! Wanna sail to Vermilion?"}
}
npcExce["Love Island_B"] = {
    ["Private Resort"] = {{21, 24}, 1, "This stone seems to be radiating with unknown energy. Do you want to touch it?"}
}
npcExce["Indigo Plateau Center"] = {
    ["Player Bedroom Pallet"] = {{13, 23}, 1, "Do you want to use my Abra's powers and send you back home?"},
}
npcExce["Private Resort"] = {
    ["Love Island_B"] = {{23, 43}, 1, "This stone seems to be radiating with unknown energy. Do you want to touch it?"}
}
npcExce["Saffron City Station_A"] = {
    ["Saffron City Station_B"] = {{9, 9}, 1, "Would you like to take the train? It costs $5,000 to go to Goldenrod."}
}
npcExce["Saffron City Station_B"] = {
    ["Saffron City Station_A"] = {{9, 7}, 1, "Would you like to return to the lobby?"}
}
npcExce["Safari Stop"] = {
    ["Safari Entrance_A"] = {{7, 4}, 1, "It will also cost $5,000 per entry if you plan to enter the EV-hunting area, compared to the standard $5,000 cost. I will teleport you to the area that specializes in HP-, Special Attack- and Defense-EV Pokemon."},
    ["Safari Effort Wald 2_A"] = {{6, 3}, 1, "Hello! Welcome to the Safari Zone! We have some options for access today! Would you like to enter the Safari Zone?"}
}
npcExce["Safari Area 3"] = {
    ["Safari Exclusive"] = {{17, 34}, 1, "Yes, let me pass", "Ah, I see you are a member, you can pass this point if you want."}
}
npcExce["Safari Exclusive"] = {
    ["Safari Area 3"] = {{21, 3}, 1, "Yes please", "Do you wish to leave the safari?"}
}
npcExce["Safari Effort Wald 2_A"] = {
    ["Safari Effort Wald 1"] = {{8, 28}, 1, "Yes.", "Would you like to be transported to the zone for Speed-, Special Defense- and Attack-EV Pokemon?"}
}
npcExce["Safari Effort Wald 1"] = {
    ["Safari Stop"] = {{6, 21}, 1, "I'd like to leave the zones, actually.", "Would you like to be transported to the zone for HP-, Special Attack- and Defense-EV Pokemon?"},
    ["Safari Effort Wald 2_A"] = {{6, 21}, 1, "Yes.", "Would you like to be transported to the zone for HP-, Special Attack- and Defense-EV Pokemon?"}
}
npcExce["Vermilion City_B"] = {
    ["One Island Ferry"] = {{38, 60}, "One Island", "Ahoy there, Where would you like to sail?"},
    ["Two Island Ferry"] = {{38, 60}, "Two Island", "Ahoy there, Where would you like to sail?"},
    ["Three Island Ferry"] = {{38, 60}, "Three Island", "Ahoy there, Where would you like to sail?"},
    ["Four Island Ferry"] = {{38, 60}, "Four Island", "Ahoy there, Where would you like to sail?"},
    ["Five Island Ferry"] = {{38, 60}, "Five Island", "Ahoy there, Where would you like to sail?"},
}

----------------------
------ JOHTO ---------
----------------------

npcExce["Dock Island"] = {
    ["Olivine City"] = {{27, 10}, "Yes", "Hey there, wanna go back in Johto?"},
}
npcExce["Goldenrod City Station_A"] = {
    ["Goldenrod City Station_B"] = {{9, 9}, "Yes", "Would you like to take the train? It costs $5,000 to go to Saffron."}
}
npcExce["Goldenrod City Station_B"] = {
    ["Goldenrod City Station_A"] = {{9, 7}, "Yes", "Would you like to return to the Goldenrod lobby?"}
}
npcExce["Johto  Zone Lobby"] = {
    ["Johto Safari Entrance"] = {{21, 6}, "Yes", "Would you like to enter the safari zone for $5,000 today?"},
}
npcExce["Route 40"] = {
    ["Cianwood City"] = {{19, 18}, 1, "Ahoy, kid. Where do you wanna go? Since you have a transit pass, the trip will be [00ff00]free[-] of charge."},
    ["Route 48"] = {{19, 18}, 2, "Ahoy, kid. Where do you wanna go? Since you have a transit pass, the trip will be [00ff00]free[-] of charge."},
}
npcExce["Cianwood City"] = {
    ["Route 40"] = {{17, 22}, 1, "Ahoy, kid. Where do you wanna go? Since you have a transit pass, the trip will be [00ff00]free[-] of charge."},
    ["Route 48"] = {{17, 22}, 2, "Ahoy, kid. Where do you wanna go? Since you have a transit pass, the trip will be [00ff00]free[-] of charge."},
}
npcExce["Route 48"] = {
    ["Route 40"] = {{11, 43}, 1, "Ahoy, kid. Where do you wanna go? Since you have a transit pass, the trip will be [00ff00]free[-] of charge."},
    ["Cianwood City"] = {{11, 43}, 2, "Ahoy, kid. Where do you wanna go? Since you have a transit pass, the trip will be [00ff00]free[-] of charge."},
}
-- npcExce["Route 40"] = {
--     ["Cianwood City"] = {{19, 18}, 1, "Ahoy, kid. Where do you wanna go? It will cost you only [ff6347]$2,500[-]!"},
--     ["Route 48"] = {{19, 18}, 2, "Ahoy, kid. Where do you wanna go? It will cost you only [ff6347]$2,500[-]!"},
-- }
-- npcExce["Cianwood City"] = {
--     ["Route 40"] = {{17, 22}, 1, "Ahoy, kid. Where do you wanna go? It will cost you only [ff6347]$2,500[-]!"},
--     ["Route 48"] = {{17, 22}, 2, "Ahoy, kid. Where do you wanna go? It will cost you only [ff6347]$2,500[-]!"},
-- }
-- npcExce["Route 48"] = {
--     ["Route 40"] = {{11, 43}, 1, "Ahoy, kid. Where do you wanna go? It will cost you only [ff6347]$2,500[-]!"},
--     ["Cianwood City"] = {{11, 43}, 2, "Ahoy, kid. Where do you wanna go? It will cost you only [ff6347]$2,500[-]!"},
-- }
----------------------
------ HOENN ---------
----------------------

npcExce["Cable Car Station 1"] = {
    ["Cable Car Station 2"] = {{10, 6}, "Yes", "Do you want to be taken to the top of Mt. Chimney?"}
}
npcExce["Cable Car Station 2"] = {
    ["Cable Car Station 1"] = {{10, 6}, "Yes", "Do you want to be taken to the bottom of Mt. Chimney?"}
}
npcExce["Leev Town Port"] = {
    ["Lilycove City Harbor"] = {{9, 10}, "Yes", "Hey there, wanna go back to Hoenn?"}
}
npcExce["Moon_A"] = {
    ["Mossdeep City Space Center 2F"] = {{16, 48}, 2, "What should I ask Elgyem to do?"}
}
npcExce["Moon B1F_B"] = {
    ["Sootopolis City"] = {{60, 23}, "Yes", "Should I go back to Earth?"}
}
npcExce["Mossdeep City Space Center 2F"] = {
    ["Moon_A"] = {{15, 9}, "Yes", "Oh hello there. Wait, you are the kid that went on the Moon instead of Jackson, right? Tell you what. We found this Elgyem on the Moon, and surprisingly, it can teleport anyone back there. And it can heal your Pokemon 4 times per session! But I need special pills to feed it, which costs 15,000 Pokedollars. So, want to go on the Moon for 15,000 Pokedollars? I'll include the oxygen needed for free."}
}

npcExce["Rusturf Tunnel_C"] = {
    ["Haunted Site"] = {{26, 15}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Route 115_A"] = {
    ["Mineral Site_A"] = {{81, 78}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Fiery Path"] = {
    ["Feral Site_A"] = {{14, 32}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Route 103_C"] = {
    ["Glacial Site"] = {{55, 4}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Route 119A"] = {
    ["Natural Site"] = {{16, 68}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Route 111 Desert"] = {
    ["Historical Site_A"] = {{34, 21}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Lavaridge Town"] = {
    ["Valley Of Steel Entrance"] = {{18, 34}, "Yes.", "So, would you like to go for 5.000 poke-dollars?"}
}
npcExce["Valley Of Steel Entrance"] = {
    ["Lavaridge Town"] = {{30, 2}, "Yes.", "Would you like to go back to Lavaridge Town?"}
}

npcExce["Lilycove City"] = {
    ["Vulcan Island Shore"] = {{24, 30}, 1, "Happy summer Holiday! Do you want to sail with me to Vulcan Island?"},
    ["Murky Town Ferry"] = {{24, 30}, 1 ,"Do you want to go to Murky Town?"}

}
npcExce["Slateport City"] = {
      ["Crater Town Shore"] = {{55, 60}, 1, "I can sail to Crater Town Shore if you want. Since you have a transit pass, the tour will be free of charge. Are you interested?"}
}
npcExce["Crater Town Shore"] = {
      ["Slateport City"] = {{6, 5}, 1, "I can sail to Slateport City if you want. Since you have a transit pass, the tour will be free of charge. Are you interested?"}
}
npcExce["Hoenn Safari Zone Lobby"] = {
    ["Hoenn Safari Zone Area 1"] = {{21, 6}, 1, "Hello! Welcome to the Hoenn Safari Zone! ..."},
}
----------------------
------ SINNOH ---------
----------------------
npcExce["Snowpoint City"] = {
      ["Fight Area"] = {{7, 52}, 1, "Would you like me to transit you to the Fight Area? I would be honored!"}
}

npcExce["Fight Area"] = {
      ["Snowpoint City"] = {{10, 16}, 1, "Would you like me to transit you back to Snowpoint City?"}
}

npcExce["Sinnoh Safari Stop"] = {
      ["Sinnoh Safari Area Zone 2"] = {{6, 3}, "24 Hour Pass ($50,000)", "Hello! Welcome to the Sinnoh Safari Zone! We have some options for access today! Would you like to enter the Safari Zone?"}
}
npcExce["Hoenn Safari Zone Area 1"] = {
    ["Hoenn Safari Zone Lobby"] = {{24, 47}, 1, "Are you sure you want to leave the Safari Zone?"},
}

----------------------
---- Sevii Islands ----
----------------------

--[[pcExce["One Island Ferry"] = {
    ["Vermilion City_A"] = {{7, 8}, "Vermilion City", "Ahoy There, Where would you like to sail?"},
    ["Two Island Ferry"] = {{7, 8}, "Two Island", "Ahoy There, Where would you like to sail?"},
    ["Three Island Ferry"] = {{7, 8}, "Three Island", "Ahoy There, Where would you like to sail?"},
    ["Four Island Ferry"] = {{7, 8}, "Four Island", "Ahoy There, Where would you like to sail?"},
    ["Five Island Ferry"] = {{7, 8}, "Five Island", "Ahoy There, Where would you like to sail?"},
}
npcExce["Two Island Ferry"] = {
    ["Vermilion City_A"] = {{7, 8}, "Vermilion City", "Ahoy There, Where would you like to sail?"},
    ["One Island Ferry"] = {{7, 8}, "One Island", "Ahoy There, Where would you like to sail?"},
    ["Three Island Ferry"] = {{7, 8}, "Three Island", "Ahoy There, Where would you like to sail?"},
    ["Four Island Ferry"] = {{7, 8}, "Four Island", "Ahoy There, Where would you like to sail?"},
    ["Five Island Ferry"] = {{7, 8}, "Five Island", "Ahoy There, Where would you like to sail?"},
}
npcExce["Three Island Ferry"] = {
    ["Vermilion City_A"] = {{7, 8}, "Vermilion City", "Ahoy there, Where would you like to sail?"},
    ["One Island Ferry"] = {{7, 8}, "One Island", "Ahoy there, Where would you like to sail?"},
    ["Two Island Ferry"] = {{7, 8}, "Two Island", "Ahoy there, Where would you like to sail?"},
    ["Four Island Ferry"] = {{7, 8}, "Four Island", "Ahoy there, Where would you like to sail?"},
    ["Five Island Ferry"] = {{7, 8}, "Five Island", "Ahoy there, Where would you like to sail?"},
}
npcExce["Four Island Ferry"] = {
    ["Vermilion City_A"] = {{7, 8}, "Vermilion City", "Ahoy there, Where would you like to sail?"},
    ["One Island Ferry"] = {{7, 8}, "One Island", "Ahoy there, Where would you like to sail?"},
    ["Two Island Ferry"] = {{7, 8}, "Two Island", "Ahoy there, Where would you like to sail?"},
    ["Three Island Ferry"] = {{7, 8}, "Three Island", "Ahoy there, Where would you like to sail?"},
    ["Five Island Ferry"] = {{7, 8}, "Five Island", "Ahoy there, Where would you like to sail?"},
}
npcExce["Five Island Ferry"] = {
    ["Vermilion City_A"] = {{7, 8}, "Vermilion City", "Ahoy there, Where would you like to sail?"},
    ["One Island Ferry"] = {{7, 8}, "One Island", "Ahoy there, Where would you like to sail?"},
    ["Two Island Ferry"] = {{7, 8}, "Two Island", "Ahoy there, Where would you like to sail?"},
    ["Three Island Ferry"] = {{7, 8}, "Three Island", "Ahoy there, Where would you like to sail?"},
    ["Four Island Ferry"] = {{7, 8}, "Four Island", "Ahoy there, Where would you like to sail?"},
}]]

----------------------
---- Trainers Valley ----
----------------------

npcExce["Trainers Valley Station Floor 2"] = {
    ["Saffron City Station Floor 2"] = {{14, 10}, "Saffron", "Where would you like to go?"},
	["Goldenrod City Station Floor 2"] = {{14, 10}, "Goldenrod", "Where would you like to go?"}
}

----------------------
---- INTER REGION ----
----------------------

npcExce["Goldenrod City Station Floor 2"] = {
    ["Saffron City Station Floor 2"] = {{14, 10}, {"Yes", "Saffron City"}, {"Are you sure you would like to board on the ride to Goldenrod City at this moment?", "Where do you want to go?"}},
    ["Trainers Valley Station Floor 2"] = {{14, 10}, "Trainers Valley", "Where do you want to go?"}
}
npcExce["Saffron City Station Floor 2"] = {
    ["Goldenrod City Station Floor 2"] = {{14, 10}, {"Yes", "Goldenrod City"}, {"Are you sure you would like to travel to Goldenrod City", "Where do you want to go?"}},
    ["Trainers Valley Station Floor 2"] = {{14, 10}, "Trainers Valley", "Where do you want to go?"}
}

npcExce["Olivine City"] = {
    ["Dock Island"] = {{17, 47}, 1, "Howdy! Where do you want to go, mate?"},
    ["Vermilion City_A"] = {{17, 47}, 2, "Howdy! Where do you want to go, mate?"},
    ["Lilycove City Harbor"] = {{17, 47}, 3, "Howdy! Where do you want to go, mate?"},
    ["Canalave City"] = {{17, 47}, 4, "Howdy! Where do you want to go, mate?"},
        
    ["Murky Town Ferry"] = {{14, 40}, 1 ,"Do you want to go to Murky Town?"},
    ["Vulcan Island Shore"] = {{14, 40}, "Yes", "Happy summer Holiday! Do you want to sail with me to Vulcan Island?"}
}

npcExce["Vermilion City_A"] = {
    ["Olivine City"] = {{58, 62}, 1, "Howdy! Where do you want to go, mate?"},
    ["Lilycove City Harbor"] = {{58, 62}, 2, "Howdy! Where do you want to go, mate?"},
    ["Canalave City"] = {{58, 62}, 3, "Howdy! Where do you want to go, mate?"},
    ["Pinkan City"] = {{48, 62}, 1, "Would you like to go to Pinkan Island? It's free for you because you have the Transit Pass.."},
    ["Love Island Ferry"] = {{53, 62}, 1, "Hey there, young trainer. What do you know about looove? Yeah, you hear me, Love, Love, Love, Love! You want to find out more about love? Why don't you show me that you looove Kanto Pokemon? ........ Well, well, you do look like you loooooove Kanto Pokemon. What do you say? Want to sail with me to Love Island? But you need to share $5,000 of your looooove too."},
    ["Munchlax Resort"] = {{53, 58}, 1, "We are sailing to Munchlax Resort. Would you like to go?"},
}

npcExce["Vermilion City_B"] = {
  ["Vulcan Island Shore"] = {{29, 67}, 1, "Happy summer Holiday! Do you want to sail with me to Vulcan Island?"},
  ["Murky Town Ferry"] = {{27, 68}, 1 ,"Do you want to go to Murky Town?"}
}


npcExce["Lilycove City Harbor"] = {
    ["Leev Town Port"] = {{8, 10}, 1, "Howdy! Where do you want to go, mate?"},
    ["Vermilion City_A"] = {{8, 10}, 2, "Howdy! Where do you want to go, mate?"},
    ["Olivine City"] = {{8, 10}, 3, "Howdy! Where do you want to go, mate?"},
    ["Canalave City"] = {{8, 10}, 4, "Howdy! Where do you want to go, mate?"},
    ["Eumi Island Town"] = {{6, 8}, 1, "So, do you want to go to the new Theme Park in Eumi Island?"},
}

npcExce["Canalave City"] = {
    ["Iron Island"] = {{24, 40}, 1, "Howdy! Where do you want to go, mate?"},
    ["Vermilion City_A"] = {{24, 40}, 2, "Howdy! Where do you want to go, mate?"},
    ["Olivine City"] = {{24, 40}, 3, "Howdy! Where do you want to go, mate?"},
    ["Lilycove City Harbor"] = {{24, 40}, 4, "Howdy! Where do you want to go, mate?"},

    ["Murky Town Ferry"] = {{33, 15}, 1 ,"Do you want to go to Murky Town?"},
    ["Vulcan Island Shore"] = {{33, 15}, 1, "Happy summer Holiday! Do you want to sail with me to Vulcan Island?"}
}

----------------------
---- EVENT REGION ----
----------------------

npcExce["Murky Town Ferry"] = {
    ["Vermilion City_B"] = {{7,8}, 1,"Do you want to go back to Vermilion City?"},
    ["Olivine City"] = {{7, 8}, 1,"Do you want to go back to Olivine City"},
    ["Lilycove City"] = {{7, 8}, 1,"Do you want to go back to Lilycove City?"},
    ["Canalave City"] = {{7, 8}, 1,"Do you want to go back to Canalave City?"}
}

npcExce["Murky Town"] = {
    ["Cemetery Island Ferry"] = {{6, 30}, 1,"Where do you want to go?"},
    ["Necropolis"] = {{6, 30}, 2,"Where do you want to go?"},
    ["Serenia Village"] = {{6, 30}, 3,"Where do you want to go?"},
}

npcExce["Serenia Village"] = {
    ["Murky Town"] = {{45, 29}, 1,"Where do you want to go?"},
    ["Cemetery Island Ferry"] = {{45, 29}, 2,"Where do you want to go?"},
    ["Necropolis"] = {{45, 29}, 3,"Where do you want to go?"},
}

npcExce["Necropolis"] = {
    ["Murky Town"] = {{6, 46}, 1,"Where do you want to go?"},
    ["Cemetery Island Ferry"] = {{6, 46}, 2,"Where do you want to go?"},
    ["Serenia Village"] = {{6, 46}, 3,"Where do you want to go?"},
}

npcExce["Cemetery Island Ferry"] = {
    ["Murky Town"] = {{7, 8}, 1,"Where do you want to go?"},
    ["Necropolis"] = {{7, 8}, 2,"Where do you want to go?"},
    ["Serenia Village"] = {{7, 8}, 3,"Where do you want to go?"},
}

npcExce["Vulcanic Town"] = {
    ["Vulcan Island Shore"] = {{8, 16}, 1, "Where do you want to go?"},
    ["Alto Mare"] = {{8, 16}, 2, "Where do you want to go?"},
    ["Vulcan Cove"] = {{8, 16}, 3, "Where do you want to go?"},
}

npcExce["Alto Mare"] = {
    ["Vulcan Island Shore"] = {{48, 51}, 1, "Where do you want to go?"},
    ["Vulcanic Town"] = {{48, 51}, 2, "Where do you want to go?"},
    ["Vulcan Cove"] = {{48, 51}, 3, "Where do you want to go?"},
}

npcExce["Vulcan Cove"] = {
    ["Vulcan Island Shore"] = {{61, 40}, 1, "Where do you want to go?"},
    ["Alto Mare"] = {{61, 40}, 2, "Where do you want to go?"},
    ["Vulcanic Town"] = {{61, 40}, 3, "Where do you want to go?"},
}

npcExce["Vulcan Island Shore"] = {
    ["Alto Mare"] = {{11, 47}, 1, "Where do you want to go?"},
    ["Vulcanic Town"] = {{11, 47}, 2, "Where do you want to go?"},
    ["Vulcan Cove"] = {{11, 47}, 3, "Where do you want to go?"},

    ["Vermilion City_A"] = {{11, 47}, 4, "Where do you want to go?"},
    ["Olivine City"] = {{11, 47}, 4, "Where do you want to go?"},
    ["Lilycove City"] = {{11, 47}, 4, "Where do you want to go?"},
    ["Canalave City"] = {{11, 47}, 4, "Where do you want to go?"}
}

npcExce["Pinkan Island Peaks"] = {
    ["Pinkan City"] = {{5, 33}, 1, "Alright, the gondola is back in service again! Do you want to travel to Pinkan City?"},
}

npcExce["Pinkan City"] = {
    ["Pinkan Island Peaks"] = {{66, 14}, 1, "Hey, the gondola is working again! Do you want to travel to Pinkan Island Peaks?"},
    ["Vermilion City_A"] = {{14, 26}, 1, "Would you like to go back to Vermilion City?"},
}

npcExce["Eumi Island Town"] = {
    ["Lilycove City Harbor"] = {{29, 31}, 1, "Hey there! Would you like to go back to Lilycove City?"},
    ["Eindoak Waterway"] = {{38, 31}, 1, "Oi, mate! You want to go Eindoak Town? A trip costs $2.500 but since you have a ticket, the trip will be free of charge. Watch'a think?"},
}

npcExce["Leev Town Port"] = {
    ["Lilycove City Harbor"] = {{9, 10}, 1, "Hey there, wanna go back to Hoenn?"},
}

npcExce["Eindoak Waterway"] = {
    ["Eumi Island Town"] = {{120, 78}, 1, "You're already done with your vacation?"},
}

npcExce["Munchlax Resort"] = {
    ["Vermilion City_A"] = {{14, 20}, 1, "We are sailing to Vermilion City. Would you like to go?"},
    ["Fluffles Wonderland"] = {{30, 14}, 1, "Do you want to feed it 3 Rare Candies?"},
}

-- npcExce[""] = {
--     [""] = {{}, , ""}
-- }
return npcExce
end
