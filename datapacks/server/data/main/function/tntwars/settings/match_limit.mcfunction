execute if entity @s[tag=!set] if predicate main:sneak run scoreboard players remove *match_limit settings 5
execute if entity @s[tag=!set] unless predicate main:sneak run scoreboard players add *match_limit settings 5
execute if score *match_limit settings matches ..-1 run scoreboard players set *match_limit settings 0
execute if score *match_limit settings matches 31.. run scoreboard players set *match_limit settings 30
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1
title @s[tag=!set] actionbar [{text:"Crouch and click to decrease.",color:"yellow",type:"text"}]

#convert to seconds for game
scoreboard players set *multiply settings 60
scoreboard players set *add settings 5
scoreboard players operation *match_limit_s settings = *match_limit settings
scoreboard players operation *match_limit_s settings *= *multiply settings
scoreboard players operation *match_limit_s settings += *add settings


#off
execute if score *match_limit settings matches 0 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"MATCH LIMIT",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/match_limit"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

#on
execute if score *match_limit settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"MATCH LIMIT",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/match_limit"},type:"text"},[{score:{name:"*match_limit",objective:"settings"},color:"gray",italic:1b,type:"score"},{text:" minute",type:"text"}],'']}} destroy
execute if score *match_limit settings matches 2.. run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"MATCH LIMIT",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/match_limit"},type:"text"},[{score:{name:"*match_limit",objective:"settings"},color:"gray",italic:1b,type:"score"},{text:" minutes",type:"text"}],'']}} destroy


#update other signs
#build period
scoreboard players set *subtract settings 5
scoreboard players operation *temp settings = *match_limit settings
scoreboard players operation *temp settings -= *subtract settings
execute if score *build_period settings matches 1.. if score *match_limit settings matches 5.. if score *build_period settings > *temp settings run tag @s add silent
execute if score *build_period settings matches 1.. if score *match_limit settings matches 5.. if score *build_period settings > *temp settings positioned ~ ~ ~-1 run function main:tntwars/settings/build_period

#deathmatch
scoreboard players operation *subtract settings = *build_period settings
scoreboard players operation *temp settings = *match_limit settings
scoreboard players operation *temp settings -= *subtract settings
execute if score *deathmatch settings matches 1.. if score *deathmatch settings > *temp settings run tag @s add silent
execute if score *deathmatch settings matches 1.. if score *deathmatch settings > *temp settings positioned ~ ~ ~-2 run function main:tntwars/settings/deathmatch

#update deathmatch
scoreboard players set *add settings 30
scoreboard players set *multiply settings 60
scoreboard players operation *temp settings = *match_limit settings
scoreboard players operation *temp settings -= *deathmatch settings
scoreboard players operation *deathmatch_s settings = *temp settings
scoreboard players operation *deathmatch_s settings *= *multiply settings
scoreboard players operation *deathmatch_s settings += *add settings

#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check

return 1