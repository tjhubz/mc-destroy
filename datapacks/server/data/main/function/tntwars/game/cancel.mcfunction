scoreboard players set tntwars_timer global -1
schedule clear main:tntwars/game/tick

playsound minecraft:entity.blaze.hurt master @a[tag=queue] ~ ~100 ~ 255 0
execute as @e[tag=game_starter] run data merge entity @s {CustomName:{text:"WAITING FOR PLAYERS",color:"red",bold:1b}}
execute as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:"1 player per team required.",color:"red",bold:0b}}
execute as @e[tag=game_starter] at @s run setblock ~ ~-1 ~ minecraft:blackstone_wall
execute as @e[tag=game_starter] at @s run setblock ~ ~ ~ minecraft:warped_button[face=floor,powered=false]

fill 6 8 25 6 10 26 minecraft:air
fill -6 8 25 -6 10 26 minecraft:air

return 1