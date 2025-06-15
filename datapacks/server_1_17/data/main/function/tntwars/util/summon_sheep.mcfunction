execute store result storage minecraft:sheep_health Health float 1 run scoreboard players get *sheep_health settings

execute as @e[type=minecraft:armor_stand,tag=redSpawn,limit=1] at @s run summon minecraft:sheep ~ ~ ~ {CustomNameVisible:0b,Team:"red",PersistenceRequired:1b,Color:14b,Tags:["red"],Health:12.0f,attributes:[{id:"minecraft:max_health",base:100.0d}]}
execute as @e[type=minecraft:armor_stand,tag=blueSpawn,limit=1] at @s run summon minecraft:sheep ~ ~ ~ {CustomNameVisible:0b,Team:"blue",PersistenceRequired:1b,Color:11b,Tags:["blue"],Health:20.0f,attributes:[{id:"minecraft:max_health",base:100.0d}]}
execute as @e[type=minecraft:armor_stand,tag=yellowSpawn,limit=1] at @s run summon minecraft:sheep ~ ~ ~ {CustomNameVisible:0b,Team:"yellow",PersistenceRequired:1b,Color:4b,Tags:["yellow"],Health:20.0f,attributes:[{id:"minecraft:max_health",base:100.0d}]}
execute as @e[type=minecraft:armor_stand,tag=whiteSpawn,limit=1] at @s run summon minecraft:sheep ~ ~ ~ {CustomNameVisible:0b,Team:"white",PersistenceRequired:1b,Color:0b,Tags:["white"],Health:20.0f,attributes:[{id:"minecraft:max_health",base:100.0d}]}

execute as @e[type=minecraft:sheep,tag=!tutorial] at @s run data modify entity @s Health set from storage minecraft:sheep_health Health

execute if score *sheep_glow settings matches 1 as @e[type=minecraft:sheep,tag=!tutorial] at @s run data merge entity @s {Glowing:1b}

execute store result bossbar minecraft:blue max run scoreboard players get *sheep_health settings
execute store result bossbar minecraft:red max run scoreboard players get *sheep_health settings
execute store result bossbar minecraft:yellow max run scoreboard players get *sheep_health settings
execute store result bossbar minecraft:white max run scoreboard players get *sheep_health settings

tag @e[type=minecraft:armor_stand,tag=spawn] add sheep
return 1