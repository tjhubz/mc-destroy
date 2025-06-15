#scoreboard during game
execute if score tntwars_timer global < *match_limit_s settings if entity @e[type=minecraft:sheep,tag=blue] store result score §9Sheep scoreboard run data get entity @e[type=minecraft:sheep,tag=blue,limit=1] Health
execute if score tntwars_timer global < *match_limit_s settings unless entity @e[type=minecraft:sheep,tag=blue] run scoreboard players reset §9Sheep scoreboard
execute if score tntwars_timer global < *match_limit_s settings if entity @e[type=minecraft:armor_stand,tag=blueSpawn,tag=active,tag=!sheep] unless entity @e[type=minecraft:armor_stand,tag=blue,tag=active,tag=sheep] store result score §9Players scoreboard run scoreboard players get tntwars_blue global

execute if score tntwars_timer global < *match_limit_s settings if entity @e[type=minecraft:sheep,tag=red] store result score §cSheep scoreboard run data get entity @e[type=minecraft:sheep,tag=red,limit=1] Health
execute if score tntwars_timer global < *match_limit_s settings unless entity @e[type=minecraft:sheep,tag=red] run scoreboard players reset §cSheep scoreboard
execute if score tntwars_timer global < *match_limit_s settings if entity @e[type=minecraft:armor_stand,tag=redSpawn,tag=active,tag=!sheep] unless entity @e[type=minecraft:armor_stand,tag=red,tag=active,tag=sheep] store result score §cPlayers scoreboard run scoreboard players get tntwars_red global

execute if score tntwars_timer global < *match_limit_s settings if entity @e[type=minecraft:sheep,tag=yellow] store result score §eSheep scoreboard run data get entity @e[type=minecraft:sheep,tag=yellow,limit=1] Health
execute if score tntwars_timer global < *match_limit_s settings unless entity @e[type=minecraft:sheep,tag=yellow] run scoreboard players reset §eSheep scoreboard
execute if score tntwars_timer global < *match_limit_s settings if entity @e[type=minecraft:armor_stand,tag=yellowSpawn,tag=active,tag=!sheep] unless entity @e[type=minecraft:armor_stand,tag=yellow,tag=active,tag=sheep] store result score §ePlayers scoreboard run scoreboard players get tntwars_yellow global

execute if score tntwars_timer global < *match_limit_s settings if entity @e[type=minecraft:sheep,tag=white] store result score Sheep scoreboard run data get entity @e[type=minecraft:sheep,tag=white,limit=1] Health
execute if score tntwars_timer global < *match_limit_s settings unless entity @e[type=minecraft:sheep,tag=white] run scoreboard players reset Sheep scoreboard
execute if score tntwars_timer global < *match_limit_s settings if entity @e[type=minecraft:armor_stand,tag=whiteSpawn,tag=active,tag=!sheep] unless entity @e[type=minecraft:armor_stand,tag=white,tag=active,tag=sheep] store result score Players scoreboard run scoreboard players get tntwars_white global

execute unless entity @e[type=minecraft:armor_stand,tag=blueSpawn,tag=active] if score §9Players scoreboard matches 0.. run scoreboard players reset §9Players scoreboard
execute unless entity @e[type=minecraft:armor_stand,tag=redSpawn,tag=active] if score §cPlayers scoreboard matches 0.. run scoreboard players reset §cPlayers scoreboard
execute unless entity @e[type=minecraft:armor_stand,tag=yellowSpawn,tag=active] if score §ePlayers scoreboard matches 0.. run scoreboard players reset §ePlayers scoreboard
execute unless entity @e[type=minecraft:armor_stand,tag=whiteSpawn,tag=active] if score Players scoreboard matches 0.. run scoreboard players reset Players scoreboard

execute as @e[type=minecraft:sheep,tag=blue] run scoreboard players reset §9Players scoreboard
execute as @e[type=minecraft:sheep,tag=red] run scoreboard players reset §cPlayers scoreboard
execute as @e[type=minecraft:sheep,tag=yellow] run scoreboard players reset §ePlayers scoreboard
execute as @e[type=minecraft:sheep,tag=white] run scoreboard players reset Players scoreboard
return 1