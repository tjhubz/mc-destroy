execute if entity @s[tag=!set] if predicate main:sneak run scoreboard players remove *build_period settings 1
execute if entity @s[tag=!set] unless predicate main:sneak run scoreboard players add *build_period settings 1
execute if score *build_period settings matches ..-1 run scoreboard players set *build_period settings 0
execute if score *build_period settings matches 11.. run scoreboard players set *build_period settings 10
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1
title @s[tag=!set] actionbar [{text:"Crouch and click to decrease.",color:"yellow",type:"text"}]

#math
scoreboard players set *subtract settings 5
scoreboard players operation *temp settings = *match_limit settings
scoreboard players operation *temp settings -= *subtract settings
execute if score *build_period settings > *temp settings run tellraw @s[tag=!silent] [{text:"ERROR ",color:"dark_red",bold:1b,type:"text"},{text:"Build period must be at most 5 minutes less than the match limit.",color:"red",bold:0b,type:"text"}]
execute if score *build_period settings > *temp settings run scoreboard players operation *build_period settings = *temp settings
execute if score *build_period settings matches ..-1 run scoreboard players set *build_period settings 0

#convert to ticks for bossbar
scoreboard players set *multiply settings 1200
scoreboard players operation *build_period_t settings = *build_period settings
scoreboard players operation *build_period_t settings *= *multiply settings

#convert to seconds for game
scoreboard players set *add settings 5
scoreboard players set *multiply settings 60
scoreboard players operation *build_period_s settings = *build_period settings
scoreboard players operation *build_period_s settings *= *multiply settings
scoreboard players operation *build_period_s settings += *add settings


#off
execute if score *build_period settings matches 0 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"BUILD PERIOD",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/build_period"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

#on
execute if score *build_period settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"BUILD PERIOD",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/build_period"},type:"text"},[{score:{name:"*build_period",objective:"settings"},color:"gray",italic:1b,type:"score"},{text:" minute",type:"text"}],'']}} destroy
execute if score *build_period settings matches 2.. run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"BUILD PERIOD",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/build_period"},type:"text"},[{score:{name:"*build_period",objective:"settings"},color:"gray",italic:1b,type:"score"},{text:" minutes",type:"text"}],'']}} destroy

tag @s[tag=silent] remove silent

#deathmatch
scoreboard players operation *subtract settings = *build_period settings
scoreboard players operation *temp settings = *match_limit settings
scoreboard players operation *temp settings -= *subtract settings
execute if score *deathmatch settings matches 1.. if score *deathmatch settings > *temp settings run tag @s add silent
execute if score *deathmatch settings matches 1.. if score *deathmatch settings > *temp settings positioned ~ ~ ~-1 run function main:tntwars/settings/deathmatch

#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check

return 1