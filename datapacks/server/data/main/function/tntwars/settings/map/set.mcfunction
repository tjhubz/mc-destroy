#map1
execute unless score *map settings matches 1 at @e[type=minecraft:area_effect_cloud,tag=maps] run setblock ~ ~ ~-2 minecraft:crimson_wall_sign[facing=west]{front_text:{messages:['',{text:"BLOCKS",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/map1"},type:"text"},{text:"2 Teams",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *map settings matches 1 at @e[type=minecraft:area_effect_cloud,tag=maps] run setblock ~ ~ ~-2 minecraft:warped_wall_sign[facing=west]{front_text:{messages:['',{text:"BLOCKS",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/map1"},type:"text"},{text:"2 Teams",color:"gray",italic:1b,type:"text"},'']}} replace


#map2
execute unless score *map settings matches 2 at @e[type=minecraft:area_effect_cloud,tag=maps] run setblock ~ ~-1 ~-2 minecraft:crimson_wall_sign[facing=west]{front_text:{messages:['',{text:"DOUBLE",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/map2"},type:"text"},{text:"2 Teams",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *map settings matches 2 at @e[type=minecraft:area_effect_cloud,tag=maps] run setblock ~ ~-1 ~-2 minecraft:warped_wall_sign[facing=west]{front_text:{messages:['',{text:"DOUBLE",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/map2"},type:"text"},{text:"2 Teams",color:"gray",italic:1b,type:"text"},'']}} replace


#map3
execute unless score *map settings matches 3 at @e[type=minecraft:area_effect_cloud,tag=maps] run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=west]{front_text:{messages:['',{text:"BIRCH",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/map3"},type:"text"},{text:"4 Teams",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *map settings matches 3 at @e[type=minecraft:area_effect_cloud,tag=maps] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=west]{front_text:{messages:['',{text:"BIRCH",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/map3"},type:"text"},{text:"4 Teams",color:"gray",italic:1b,type:"text"},'']}} replace


#map4
execute unless score *map settings matches 4 at @e[type=minecraft:area_effect_cloud,tag=maps] run setblock ~ ~ ~1 minecraft:crimson_wall_sign[facing=west]{front_text:{messages:['',{text:"SHROOM",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/map4"},type:"text"},{text:"4 Teams",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *map settings matches 4 at @e[type=minecraft:area_effect_cloud,tag=maps] run setblock ~ ~ ~1 minecraft:warped_wall_sign[facing=west]{front_text:{messages:['',{text:"SHROOM",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/map4"},type:"text"},{text:"4 Teams",color:"gray",italic:1b,type:"text"},'']}} replace


#map5
execute unless score *map settings matches 5 at @e[type=minecraft:area_effect_cloud,tag=maps] run setblock ~ ~-1 ~ minecraft:crimson_wall_sign[facing=west]{front_text:{messages:['',{text:"DESERT",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/map5"},type:"text"},{text:"4 Teams",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *map settings matches 5 at @e[type=minecraft:area_effect_cloud,tag=maps] run setblock ~ ~-1 ~ minecraft:warped_wall_sign[facing=west]{front_text:{messages:['',{text:"DESERT",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/map5"},type:"text"},{text:"4 Teams",color:"gray",italic:1b,type:"text"},'']}} replace

#team joiners
execute as @e[type=minecraft:area_effect_cloud,tag=join_red] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:red_concrete_powder
execute as @e[type=minecraft:area_effect_cloud,tag=join_blue] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:blue_concrete_powder

execute if score *teams settings matches 2 run team join main @a[tag=!tntwars,team=yellow]
execute if score *teams settings matches 2 as @e[type=minecraft:area_effect_cloud,tag=join_yellow] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:barrier
execute if score *teams settings matches 2 as @e[type=minecraft:area_effect_cloud,tag=join_yellow] at @s run data merge entity @s {CustomNameVisible:0b}
execute if score *teams settings matches 4 as @e[type=minecraft:area_effect_cloud,tag=join_yellow] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:yellow_concrete_powder
execute if score *teams settings matches 4 as @e[type=minecraft:area_effect_cloud,tag=join_yellow] at @s run data merge entity @s {CustomNameVisible:1b}

execute if score *teams settings matches 2 run team join main @a[tag=!tntwars,team=white]
execute if score *teams settings matches 2 as @e[type=minecraft:area_effect_cloud,tag=join_white] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:barrier
execute if score *teams settings matches 2 as @e[type=minecraft:area_effect_cloud,tag=join_white] at @s run data merge entity @s {CustomNameVisible:0b}
execute if score *teams settings matches 4 as @e[type=minecraft:area_effect_cloud,tag=join_white] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:white_concrete_powder
execute if score *teams settings matches 4 as @e[type=minecraft:area_effect_cloud,tag=join_white] at @s run data merge entity @s {CustomNameVisible:1b}

return 1