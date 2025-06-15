execute if entity @s[tag=!set] if predicate main:sneak run scoreboard players remove *respawn_time settings 1
execute if entity @s[tag=!set] unless predicate main:sneak run scoreboard players add *respawn_time settings 1
execute if score *respawn_time settings matches ..-1 run scoreboard players set *respawn_time settings 0
execute if score *respawn_time settings matches 11.. run scoreboard players set *respawn_time settings 10
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1
title @s[tag=!set] actionbar [{text:"Crouch and click to decrease.",color:"yellow",type:"text"}]

#convert to seconds for game
scoreboard players set *multiply settings 20
scoreboard players operation *respawn_time_t settings = *respawn_time settings
scoreboard players operation *respawn_time_t settings *= *multiply settings

#off
execute if score *respawn_time settings matches 0 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"RESPAWN TIME",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/respawn_time"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

#on
execute if score *respawn_time settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"RESPAWN TIME",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/respawn_time"},type:"text"},[{score:{name:"*respawn_time",objective:"settings"},color:"gray",italic:1b,type:"score"},{text:" second",type:"text"}],'']}} destroy
execute if score *respawn_time settings matches 2.. run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"RESPAWN TIME",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/respawn_time"},type:"text"},[{score:{name:"*respawn_time",objective:"settings"},color:"gray",italic:1b,type:"score"},{text:" seconds",type:"text"}],'']}} destroy

#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check
return 1