execute if entity @s run scoreboard players add *deathmatch_type settings 1
execute if score *deathmatch_type settings matches 3.. run scoreboard players set *deathmatch_type settings 1
playsound minecraft:ui.button.click master @s ~ ~100 ~ 10000 1


#off
execute if score *deathmatch_type settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"END GAME",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/deathmatch_type"},type:"text"},{text:"Rockets",color:"gray",italic:1b,type:"text"},'']}} destroy

#on
execute if score *deathmatch_type settings matches 2 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"END GAME",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/deathmatch_type"},type:"text"},{text:"Chickens",color:"gray",italic:1b,type:"text"},'']}} destroy

return 1