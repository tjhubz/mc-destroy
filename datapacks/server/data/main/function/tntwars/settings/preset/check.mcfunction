scoreboard players set *preset settings 0

#classic
execute if score *crossing settings matches 0 if score *launching settings matches 0 if score *bridges settings matches 0 if score *sheep_health settings matches 1.. if score *respawning settings matches 0 if score *deathmatch settings matches 5 if score *build_period settings matches 2 if score *sheep_glow settings matches 1 if score *fall_damage settings matches 0 if score *respawn_time settings matches 1 run scoreboard players set *preset settings 1

#anarchy
execute if score *crossing settings matches 1 if score *launching settings matches 1 if score *bridges settings matches 1 if score *sheep_health settings matches 1.. if score *respawning settings matches 1 if score *deathmatch settings matches 5 if score *build_period settings matches 2 if score *sheep_glow settings matches 1 if score *fall_damage settings matches 0 if score *respawn_time settings matches 3 run scoreboard players set *preset settings 2

#deathmatch
execute if score *crossing settings matches 0 if score *launching settings matches 0 if score *bridges settings matches 0 if score *sheep_health settings matches 0 if score *respawning settings matches 0 if score *deathmatch settings matches 5 if score *build_period settings matches 2 if score *fall_damage settings matches 0 run scoreboard players set *preset settings 3

#classic sign
execute if score *preset settings matches 1 run function main:tntwars/settings/hologram/classic
execute if score *preset settings matches 1 at @e[type=minecraft:marker,tag=preset] if block ~ ~ ~ minecraft:crimson_wall_sign run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"CLASSIC",color:"gold",bold:1b,type:"text"},{text:"ON",color:"gray",italic:1b,type:"text"},'']}} destroy
execute unless score *preset settings matches 1 at @e[type=minecraft:marker,tag=preset] if block ~ ~ ~ minecraft:warped_wall_sign run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"CLASSIC",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/preset/classic"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

#anarchy sign
execute if score *preset settings matches 2 run function main:tntwars/settings/hologram/anarchy
execute if score *preset settings matches 2 at @e[type=minecraft:marker,tag=preset] if block ~ ~-1 ~ minecraft:crimson_wall_sign run setblock ~ ~-1 ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"CHAOS",color:"gold",bold:1b,type:"text"},{text:"ON",color:"gray",italic:1b,type:"text"},'']}} destroy
execute unless score *preset settings matches 2 at @e[type=minecraft:marker,tag=preset] if block ~ ~-1 ~ minecraft:warped_wall_sign run setblock ~ ~-1 ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"CHAOS",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/preset/anarchy"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

#deathmatch sign
execute if score *preset settings matches 3 run function main:tntwars/settings/hologram/deathmatch
execute if score *preset settings matches 3 at @e[type=minecraft:marker,tag=preset] if block ~ ~-2 ~ minecraft:crimson_wall_sign run setblock ~ ~-2 ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"DEATHMATCH",color:"gold",bold:1b,type:"text"},{text:"ON",color:"gray",italic:1b,type:"text"},'']}} destroy
execute unless score *preset settings matches 3 at @e[type=minecraft:marker,tag=preset] if block ~ ~-2 ~ minecraft:warped_wall_sign run setblock ~ ~-2 ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"DEATHMATCH",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/preset/deathmatch"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

execute if score *preset settings matches 0 run function main:tntwars/settings/hologram/custom

return 1