#Build timer
execute if score tntwars_timer global < *build_period_s settings run bossbar set minecraft:build players @a[tag=tntwars]
execute if score tntwars_timer global >= *build_period_s settings run bossbar set minecraft:build players
execute if score tntwars_timer global < *build_period_s settings store result bossbar build value run scoreboard players get tntwars_build global
execute if score tntwars_timer global < *build_period_s settings if score tntwars_build global matches 1.. run scoreboard players remove tntwars_build global 1


#Sheep health
execute if score *sheep_health settings matches 1.. if entity @e[type=minecraft:sheep,tag=blue] if score tntwars_timer global >= *build_period_s settings if score tntwars_teams global matches 4 as @e[type=minecraft:armor_stand,tag=spawn,tag=blueSpawn] at @s positioned ~-25 0 ~-25 run bossbar set minecraft:blue players @a[gamemode=!adventure,dx=50,dy=32,dz=50]
execute if score *sheep_health settings matches 1.. if entity @e[type=minecraft:sheep,tag=blue] if score tntwars_timer global >= *build_period_s settings if score tntwars_teams global matches 2 as @e[type=minecraft:armor_stand,tag=spawn,tag=blueSpawn] at @s positioned ~-22 0 ~-24 run bossbar set minecraft:blue players @a[gamemode=!adventure,dx=43,dy=32,dz=47]
execute if entity @e[type=minecraft:sheep,tag=blue] store result bossbar blue value run data get entity @e[type=minecraft:sheep,tag=blue,limit=1] Health
execute unless entity @e[type=minecraft:sheep,tag=blue] run bossbar set minecraft:blue value 0
execute unless entity @e[type=minecraft:sheep,tag=blue] run bossbar set minecraft:blue players

execute if score *sheep_health settings matches 1.. if entity @e[type=minecraft:sheep,tag=red] if score tntwars_timer global >= *build_period_s settings if score tntwars_teams global matches 4 as @e[type=minecraft:armor_stand,tag=spawn,tag=redSpawn] at @s positioned ~-25 0 ~-25 run bossbar set minecraft:red players @a[gamemode=!adventure,dx=50,dy=32,dz=50]
execute if score *sheep_health settings matches 1.. if entity @e[type=minecraft:sheep,tag=red] if score tntwars_timer global >= *build_period_s settings if score tntwars_teams global matches 2 as @e[type=minecraft:armor_stand,tag=spawn,tag=redSpawn] at @s positioned ~-22 0 ~-24 run bossbar set minecraft:red players @a[gamemode=!adventure,dx=43,dy=32,dz=47]
execute if entity @e[type=minecraft:sheep,tag=red] store result bossbar red value run data get entity @e[type=minecraft:sheep,tag=red,limit=1] Health
execute unless entity @e[type=minecraft:sheep,tag=red] run bossbar set minecraft:red value 0
execute unless entity @e[type=minecraft:sheep,tag=red] run bossbar set minecraft:red players

execute if score *sheep_health settings matches 1.. if entity @e[type=minecraft:sheep,tag=yellow] if score tntwars_timer global >= *build_period_s settings if score tntwars_teams global matches 4 as @e[type=minecraft:armor_stand,tag=spawn,tag=yellowSpawn] at @s positioned ~-25 0 ~-25 run bossbar set minecraft:yellow players @a[gamemode=!adventure,dx=50,dy=32,dz=50]
execute if score *sheep_health settings matches 1.. if entity @e[type=minecraft:sheep,tag=yellow] if score tntwars_timer global >= *build_period_s settings if score tntwars_teams global matches 2 as @e[type=minecraft:armor_stand,tag=spawn,tag=yellowSpawn] at @s positioned ~-22 0 ~-24 run bossbar set minecraft:yellow players @a[gamemode=!adventure,dx=43,dy=32,dz=47]
execute if entity @e[type=minecraft:sheep,tag=yellow] store result bossbar yellow value run data get entity @e[type=minecraft:sheep,tag=yellow,limit=1] Health
execute unless entity @e[type=minecraft:sheep,tag=yellow] run bossbar set minecraft:yellow value 0
execute unless entity @e[type=minecraft:sheep,tag=yellow] run bossbar set minecraft:yellow players

execute if score *sheep_health settings matches 1.. if entity @e[type=minecraft:sheep,tag=white] if score tntwars_timer global >= *build_period_s settings if score tntwars_teams global matches 4 as @e[type=minecraft:armor_stand,tag=spawn,tag=whiteSpawn] at @s positioned ~-25 0 ~-25 run bossbar set minecraft:white players @a[gamemode=!adventure,dx=50,dy=32,dz=50]
execute if score *sheep_health settings matches 1.. if entity @e[type=minecraft:sheep,tag=white] if score tntwars_timer global >= *build_period_s settings if score tntwars_teams global matches 2 as @e[type=minecraft:armor_stand,tag=spawn,tag=whiteSpawn] at @s positioned ~-22 0 ~-24 run bossbar set minecraft:white players @a[gamemode=!adventure,dx=43,dy=32,dz=47]
execute if entity @e[type=minecraft:sheep,tag=white] store result bossbar white value run data get entity @e[type=minecraft:sheep,tag=white,limit=1] Health
execute unless entity @e[type=minecraft:sheep,tag=white] run bossbar set minecraft:white value 0
execute unless entity @e[type=minecraft:sheep,tag=white] run bossbar set minecraft:white players

return 1