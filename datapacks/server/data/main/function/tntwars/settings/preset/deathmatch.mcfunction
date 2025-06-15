tag @s add set
scoreboard players set *crossing settings 0
scoreboard players set *launching settings 0
scoreboard players set *bridges settings 0
scoreboard players set *sheep_health settings 0
scoreboard players set *respawning settings 0
scoreboard players set *deathmatch settings 5
scoreboard players set *build_period settings 2
scoreboard players set *sheep_glow settings 0
scoreboard players set *fall_damage settings 0
scoreboard players set *respawn_time settings 0
scoreboard players set *alert settings 0

execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~-1 ~-2 run function main:tntwars/settings/crossing
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~-1 ~-4 run function main:tntwars/settings/launching
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~-1 ~-3 run function main:tntwars/settings/bridges
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~ ~-5 run function main:tntwars/settings/sheep_health
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~-2 ~-2 run function main:tntwars/settings/respawning
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~ ~-4 run function main:tntwars/settings/deathmatch
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~ ~-3 run function main:tntwars/settings/build_period
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~ ~-2 run function main:tntwars/settings/match_limit
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~-2 ~-4 run function main:tntwars/settings/sheep_glow
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~-2 ~-5 run function main:tntwars/settings/fall_damage
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~-2 ~-3 run function main:tntwars/settings/respawn_time
execute at @e[type=minecraft:area_effect_cloud,tag=preset] positioned ~ ~-1 ~-5 run function main:tntwars/settings/alert

tag @s remove set

function main:tntwars/settings/preset/check

return 1