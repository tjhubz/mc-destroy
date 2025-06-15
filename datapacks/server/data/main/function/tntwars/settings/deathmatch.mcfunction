execute if entity @s[tag=!set] if predicate main:sneak run scoreboard players remove *deathmatch settings 1
execute if entity @s[tag=!set] unless predicate main:sneak run scoreboard players add *deathmatch settings 1
execute if score *deathmatch settings matches ..-1 run scoreboard players set *deathmatch settings 0
execute if score *deathmatch settings matches 31.. run scoreboard players set *deathmatch settings 30
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1
title @s[tag=!set] actionbar [{text:"Crouch and click to decrease.",color:"yellow",type:"text"}]
execute if score *match_limit settings matches 0 run tag @s add silent


#math
scoreboard players operation *subtract settings = *build_period settings
scoreboard players operation *temp settings = *match_limit settings
scoreboard players operation *temp settings -= *subtract settings
execute unless score *build_period settings matches 0 if score *deathmatch settings > *temp settings run tellraw @s[tag=!silent] [{text:"ERROR ",color:"dark_red",bold:1b,type:"text"},{text:"The deathmatch cannot start before the build period ends.",color:"red",bold:0b,type:"text"}]
execute unless score *build_period settings matches 0 if score *deathmatch settings > *temp settings run scoreboard players operation *deathmatch settings = *temp settings
execute if score *build_period settings matches 0 if score *deathmatch settings > *match_limit settings run tellraw @s[tag=!silent] [{text:"ERROR ",color:"dark_red",bold:1b,type:"text"},{text:"The time spent in deathmatch cannot exceed the total match time.",color:"red",bold:0b,type:"text"}]
execute if score *build_period settings matches 0 if score *deathmatch settings > *match_limit settings run scoreboard players operation *deathmatch settings = *match_limit settings
execute if score *deathmatch settings matches ..-1 run scoreboard players set *deathmatch settings 0

#convert to seconds for game
scoreboard players set *add settings 5
scoreboard players set *multiply settings 60
scoreboard players operation *temp settings = *match_limit settings
scoreboard players operation *temp settings -= *deathmatch settings
scoreboard players operation *deathmatch_s settings = *temp settings
scoreboard players operation *deathmatch_s settings *= *multiply settings
scoreboard players operation *deathmatch_s settings += *add settings


#off
execute if score *deathmatch settings matches 0 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"DEATHMATCH",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/deathmatch"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

#on
execute if score *deathmatch settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"DEATHMATCH",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/deathmatch"},type:"text"},[{score:{name:"*deathmatch",objective:"settings"},color:"gray",italic:1b,type:"score"},{text:" minute",type:"text"}],'']}} destroy
execute if score *deathmatch settings matches 2.. run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"DEATHMATCH",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/deathmatch"},type:"text"},[{score:{name:"*deathmatch",objective:"settings"},color:"gray",italic:1b,type:"score"},{text:" minutes",type:"text"}],'']}} destroy

#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check

tag @s[tag=silent] remove silent

return 1