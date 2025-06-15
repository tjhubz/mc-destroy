#Repeats every second
execute if score tntwars_timer global < *match_limit_s settings run scoreboard players add tntwars_timer global 1

execute if score tntwars_timer global matches 1 run playsound minecraft:block.note_block.pling master @a[tag=queue] ~ ~100 ~ 255 1
execute if score tntwars_timer global matches 2 as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:"3",color:"yellow",bold:0b}}
execute if score tntwars_timer global matches 3 as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:"2",color:"yellow",bold:0b}}
execute if score tntwars_timer global matches 4 as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:"1",color:"yellow",bold:0b}}
execute if score tntwars_timer global matches 5 as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:"Starting",color:"yellow",bold:0b}}
execute if score tntwars_timer global matches 5 run function main:tntwars/game/start

#build period
execute if score *build_period settings matches 1.. if score tntwars_timer global < *build_period_s settings run bossbar set minecraft:build players @a[tag=tntwars]
execute if score *build_period settings matches 1.. if score tntwars_timer global = *build_period_s settings run tellraw @a[tag=tntwars] ["",{text:"\n",type:"text"},{text:"Build period over!",color:"light_purple",type:"text"},{text:"\n",type:"text"}]
execute if score *build_period settings matches 1.. if score tntwars_timer global = *build_period_s settings run bossbar set minecraft:game color yellow
execute if score *build_period settings matches 1.. if score tntwars_timer global = *build_period_s settings run bossbar set minecraft:build players
execute if score *build_period settings matches 1.. if score tntwars_timer global = *build_period_s settings run playsound minecraft:block.note_block.pling master @a[tag=tntwars] ~ ~100 ~ 255 1

#game bossbar
execute if score tntwars_timer global matches 5.. if score tntwars_timer global <= *match_limit_s settings run function main:tntwars/timer_bossbar

#end
execute if score tntwars_timer global = *match_limit_s settings run tag @e[tag=active] remove active
execute if score tntwars_timer global = *match_limit_s settings run function main:tntwars/game/end

#deathmatch
execute if score *deathmatch settings matches 1.. if score tntwars_timer global = *deathmatch_s settings run function main:tntwars/game/deathmatch/start

execute if score tntwars_timer global < *match_limit_s settings run schedule function main:tntwars/game/tick 1s replace

return 1