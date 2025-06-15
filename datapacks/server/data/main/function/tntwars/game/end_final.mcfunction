#map cycle
execute if score *cycle settings matches 1 if score *teams settings matches 2 if score *map settings matches 3.. run scoreboard players set *map settings 0
execute if score *cycle settings matches 1 if score *teams settings matches 4 if score *map settings matches ..1 run scoreboard players set *map settings 2
execute if score *cycle settings matches 1 run scoreboard players add *map settings 1

#map reset
function main:tntwars/map/reset

#bossbar reset
bossbar set minecraft:blue players
bossbar set minecraft:red players
bossbar set minecraft:white players
bossbar set minecraft:yellow players
bossbar set minecraft:game players

scoreboard objectives setdisplay sidebar.team.blue
scoreboard objectives setdisplay sidebar.team.red
scoreboard objectives setdisplay sidebar.team.yellow
scoreboard objectives setdisplay sidebar.team.gray

execute as @e[tag=randomize_teams] run data modify entity @s CustomNameVisible set value 1b
execute as @e[tag=randomize_teams] at @s run setblock ~ ~ ~ minecraft:blackstone_wall
execute as @e[tag=randomize_teams] at @s run setblock ~ ~1 ~ minecraft:stone_button[face=floor]


execute as @e[tag=game_starter] run data merge entity @s {CustomName:{text:" ",color:"red",bold:1b}}
execute as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:" ",color:"red",bold:0b}}
execute as @e[tag=game_starter] run data merge entity @s {CustomNameVisible:1b,CustomName:{text:"WAITING FOR PLAYERS",color:"red",bold:1b}}
execute as @e[tag=game_countdown] run data merge entity @s {CustomNameVisible:1b,CustomName:{text:"1 player per team required.",color:"red",bold:0b}}
execute as @e[tag=game_starter] at @s run setblock ~ ~-1 ~ minecraft:blackstone_wall
execute as @e[tag=game_starter] at @s run setblock ~ ~ ~ minecraft:warped_button[face=floor]

fill 6 8 25 6 10 26 minecraft:air
fill -6 8 25 -6 10 26 minecraft:air

execute as @a[tag=tntwars] at @s run function main:server/rejoin_player
scoreboard players set tntwars_timer global -1

scoreboard players set *change_mode settings 0
scoreboard players set *change_map settings 0

scoreboard players set *seconds temp 0
scoreboard players set *minutes temp 0

execute as @a[tag=autoqueue] at @s run playsound minecraft:entity.chicken.egg master @s ~ ~100 ~ 255 2
execute as @a[tag=autoqueue] at @s run tag @s add queue
execute as @a[tag=autoqueue] at @s run tellraw @s [{text:"AUTOQUEUE",color:"dark_green",bold:1b,type:"text"},{text:" You were automatically added to the queue. Do /queue to leave it!",color:"green",bold:0b,type:"text"}]

return 1