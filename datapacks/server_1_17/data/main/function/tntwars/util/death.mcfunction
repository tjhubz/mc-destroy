execute if score *respawn_time settings matches 1.. if score @s death < *respawn_time_t settings run gamemode spectator @s[gamemode=!spectator]

#eliminated
execute if entity @s[tag=alive,tag=died] run title @s title [{text:"ELIMINATED",color:"red",type:"text"}]
execute if entity @s[tag=alive,tag=died] run tag @s remove alive
execute if entity @s[tag=died] run tag @s remove died

#respawning..
execute if score *respawn_time settings matches 1.. if score @s[tag=alive] death < *respawn_time_t settings run title @s times 0 20 10
execute if score *respawn_time settings matches 1.. if score @s[tag=alive] death < *respawn_time_t settings run title @s title [{text:" ",color:"red",type:"text"}]
execute if score *respawn_time settings matches 1.. if score @s[tag=alive] death < *respawn_time_t settings run title @s subtitle [{text:"Respawning...",color:"green",italic:1b,type:"text"}]


#respawn back
execute if score @s[tag=alive] death = *respawn_time_t settings run title @s reset
execute if entity @s[tag=alive,team=blue] if score @s death = *respawn_time_t settings run gamemode survival @s[gamemode=!survival]
execute if entity @s[tag=alive,team=blue] if score @s death = *respawn_time_t settings run tp @s @e[type=minecraft:armor_stand,tag=blueSpawn,tag=active,limit=1]

execute if entity @s[tag=alive,team=red] if score @s death = *respawn_time_t settings run gamemode survival @s[gamemode=!survival]
execute if entity @s[tag=alive,team=red] if score @s death = *respawn_time_t settings run tp @s @e[type=minecraft:armor_stand,tag=redSpawn,tag=active,limit=1]

execute if entity @s[tag=alive,team=yellow] if score @s death = *respawn_time_t settings run gamemode survival @s[gamemode=!survival]
execute if entity @s[tag=alive,team=yellow] if score @s death = *respawn_time_t settings run tp @s @e[type=minecraft:armor_stand,tag=yellowSpawn,tag=active,limit=1]

execute if entity @s[tag=alive,team=white] if score @s death = *respawn_time_t settings run gamemode survival @s[gamemode=!survival]
execute if entity @s[tag=alive,team=white] if score @s death = *respawn_time_t settings run tp @s @e[type=minecraft:armor_stand,tag=whiteSpawn,tag=active,limit=1]

return 1