scoreboard players set #check temp 1

execute if score red_queue global matches 0 run scoreboard players set #check temp 0
execute if score blue_queue global matches 0 run scoreboard players set #check temp 0
execute if score tntwars_teams global matches 4 if score yellow_queue global matches 0 run scoreboard players set #check temp 0
execute if score tntwars_teams global matches 4 if score white_queue global matches 0 run scoreboard players set #check temp 0

execute if score #check temp matches 1 if score tntwars_timer global matches -1 as @e[tag=game_starter] run data merge entity @s {CustomName:{text:"START GAME",color:"green",bold:1b}}
execute if score #check temp matches 1 if score tntwars_timer global matches -1 as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:"Press!",color:"yellow",bold:0b}}
execute if score #check temp matches 1 if score tntwars_timer global matches -1 run setblock 0 9 35 minecraft:warped_button[face=floor]

execute if score #check temp matches 0 as @e[tag=game_starter] run data merge entity @s {CustomName:{text:"WAITING FOR PLAYERS",color:"red",bold:1b}}
execute if score #check temp matches 0 as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:"1 player per team required.",color:"red",bold:0b}}
execute if score #check temp matches 0 run setblock 0 9 35 minecraft:air
execute if score #check temp matches 0 if score tntwars_timer global matches 0..4 run function main:tntwars/game/cancel

return 1