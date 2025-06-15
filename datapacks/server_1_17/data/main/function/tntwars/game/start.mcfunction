scoreboard players reset * dead
scoreboard players add *current_id game_id 1
scoreboard players operation @a[tag=queue] game_id = *current_id game_id
scoreboard players operation *game_id global = *current_id game_id
function main:tntwars/teams/start
function main:tntwars/util/gamemode_broadcast
execute if score *sheep_health settings matches 1.. run function main:tntwars/util/summon_sheep
tag @e[type=minecraft:armor_stand,tag=spawn] add active
scoreboard players operation *minutes temp = *match_limit settings
bossbar set minecraft:game color yellow
execute store result bossbar minecraft:game max run scoreboard players get *match_limit_s settings
scoreboard objectives setdisplay sidebar.team.blue scoreboard
scoreboard objectives setdisplay sidebar.team.red scoreboard
scoreboard objectives setdisplay sidebar.team.yellow scoreboard
scoreboard objectives setdisplay sidebar.team.gray scoreboard
execute if score *build_period settings matches 1.. run bossbar set minecraft:game color green
execute if score *build_period settings matches 1.. store result bossbar minecraft:build max run scoreboard players get *build_period_t settings
execute if score *build_period settings matches 1.. run scoreboard players operation tntwars_build global = *build_period_t settings

#glass
execute if score *respawning settings matches 0 if score *sheep_health settings matches 0 as @e[type=minecraft:area_effect_cloud,tag=join_red] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:red_stained_glass replace minecraft:red_concrete_powder
execute if score *respawning settings matches 0 if score *sheep_health settings matches 0 as @e[type=minecraft:area_effect_cloud,tag=join_blue] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:blue_stained_glass replace minecraft:blue_concrete_powder
execute if score *respawning settings matches 0 if score *sheep_health settings matches 0 as @e[type=minecraft:area_effect_cloud,tag=join_yellow] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:yellow_stained_glass replace minecraft:yellow_concrete_powder
execute if score *respawning settings matches 0 if score *sheep_health settings matches 0 as @e[type=minecraft:area_effect_cloud,tag=join_white] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:white_stained_glass replace minecraft:white_concrete_powder


execute as @e[tag=game_starter] run data merge entity @s {CustomName:{text:"Join a team!",color:"gold",bold:0b}}
execute as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:"-=-",color:"yellow",bold:0b}}
execute as @e[tag=game_starter] at @s run fill ~ ~-1 ~ ~ ~ ~ minecraft:air

execute as @e[tag=randomize_teams] run data modify entity @s CustomNameVisible set value 0b
execute as @e[tag=randomize_teams] at @s run fill ~ ~ ~ ~ ~1 ~ minecraft:air

return 1