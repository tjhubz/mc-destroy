playsound minecraft:entity.wither.death master @a[team=!tutorial] ~ ~100 ~ 10000 1
gamemode spectator @a[tag=tntwars]
clear @a[tag=tntwars]
kill @e[type=minecraft:sheep,tag=!tutorial]
kill @e[type=minecraft:chicken]
kill @e[type=#minecraft:boat]
bossbar set minecraft:blue players
bossbar set minecraft:red players
bossbar set minecraft:yellow players
bossbar set minecraft:white players
bossbar set minecraft:game players
scoreboard players operation tntwars_timer global = *match_limit_s settings
scoreboard players add tntwars_timer global 1
scoreboard players reset *game_id global

execute as @e[type=minecraft:area_effect_cloud,tag=join_red] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:red_stained_glass replace minecraft:red_concrete_powder
execute as @e[type=minecraft:area_effect_cloud,tag=join_blue] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:blue_stained_glass replace minecraft:blue_concrete_powder
execute as @e[type=minecraft:area_effect_cloud,tag=join_yellow] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:yellow_stained_glass replace minecraft:yellow_concrete_powder
execute as @e[type=minecraft:area_effect_cloud,tag=join_white] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:white_stained_glass replace minecraft:white_concrete_powder

execute as @e[tag=game_starter] run data merge entity @s {CustomName:{text:"====================",color:"red",bold:1b}}
execute as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:"====================",color:"red",bold:0b}}

#tie
execute if score tntwars_timer global > *build_period_s settings unless entity @s[team=main] unless entity @e[type=minecraft:armor_stand,tag=active,tag=redSpawn] unless entity @e[type=minecraft:armor_stand,tag=active,tag=blueSpawn] unless entity @e[type=minecraft:armor_stand,tag=active,tag=yellowSpawn] unless entity @e[type=minecraft:armor_stand,tag=active,tag=whiteSpawn] run tellraw @a ["",{text:"\n",type:"text"},{text:"Tie!",bold:1b,color:"dark_purple",type:"text"},{text:"\n",type:"text"},{text:"Resetting...",italic:1b,color:"dark_gray",type:"text"},{text:"\n",type:"text"}]

#red win
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=redSpawn] if score tntwars_timer global > *build_period_s settings run tellraw @a[team=!tutorial] ["",{text:"\n",type:"text"},{text:"Red wins!",bold:1b,color:"red",type:"text"},{text:"\n",type:"text"},{text:"Resetting...",italic:1b,color:"dark_gray",type:"text"},{text:"\n",type:"text"}]
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=redSpawn] if score tntwars_timer global > *build_period_s settings run scoreboard players add @a[team=red] tntwars_wins 1
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=redSpawn] if score tntwars_timer global > *build_period_s settings run scoreboard players add @a[team=red] souls 10

#blue win
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=blueSpawn] if score tntwars_timer global > *build_period_s settings run tellraw @a[team=!tutorial] ["",{text:"\n",type:"text"},{text:"Blue wins!",bold:1b,color:"blue",type:"text"},{text:"\n",type:"text"},{text:"Resetting...",italic:1b,color:"dark_gray",type:"text"},{text:"\n",type:"text"}]
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=blueSpawn] if score tntwars_timer global > *build_period_s settings run scoreboard players add @a[team=blue] tntwars_wins 1
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=blueSpawn] if score tntwars_timer global > *build_period_s settings run scoreboard players add @a[team=blue] souls 10

#yellow win
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=yellowSpawn] if score tntwars_timer global > *build_period_s settings run tellraw @a[team=!tutorial] ["",{text:"\n",type:"text"},{text:"Yellow wins!",bold:1b,color:"yellow",type:"text"},{text:"\n",type:"text"},{text:"Resetting...",italic:1b,color:"dark_gray",type:"text"},{text:"\n",type:"text"}]
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=yellowSpawn] if score tntwars_timer global > *build_period_s settings run scoreboard players add @a[team=yellow] tntwars_wins 1
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=yellowSpawn] if score tntwars_timer global > *build_period_s settings run scoreboard players add @a[team=yellow] souls 10

#white win
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=whiteSpawn] if score tntwars_timer global > *build_period_s settings run tellraw @a[team=!tutorial] ["",{text:"\n",type:"text"},{text:"White wins!",bold:1b,color:"white",type:"text"},{text:"\n",type:"text"},{text:"Resetting...",italic:1b,color:"dark_gray",type:"text"},{text:"\n",type:"text"}]
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=whiteSpawn] if score tntwars_timer global > *build_period_s settings run scoreboard players add @a[team=white] tntwars_wins 1
execute unless entity @s[team=main] if entity @e[type=minecraft:armor_stand,tag=active,tag=whiteSpawn] if score tntwars_timer global > *build_period_s settings run scoreboard players add @a[team=white] souls 10


tag @e[type=minecraft:armor_stand,tag=arena,tag=active] remove active

schedule function main:tntwars/game/end_final 5s replace

return 1