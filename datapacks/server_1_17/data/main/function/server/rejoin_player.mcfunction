scoreboard players add @s rejoin 0
gamemode adventure @s[gamemode=!adventure]
clear @s

title @s title [{text:" ",type:"text"}]
title @s subtitle [{text:" ",type:"text"}]

tag @s remove editing
tag @s remove inGame
tag @s[tag=queue,scores={rejoin=1}] remove queue
tag @s remove tntwars
tag @s remove oneshot
tag @s remove alive
tag @s remove break_active
tag @s remove exit
tag @s remove died

execute unless score @s loadingTimer matches 0.. run function help:f718f0b673b82e07a1899c24515961a67ec5bfd0325b0aab030baefe66a1cf85
execute if score @s loadingTimer matches 0.. run function help:ee545a6b9c44e49e9ca35f83875357cb8882d5adf44e03cbccab9ed417e54e0a
spawnpoint @s 0 11 0

function help:b1b7b32c383cf7c8ae900b807469e3bc552abb04df1f75545c9693e4e338107d

team join main

scoreboard players reset @s game_id
scoreboard players reset @s powerCooldown
scoreboard players reset @s damage
scoreboard players reset @s shotArrow
scoreboard players reset @s shotTrident
scoreboard players reset @s rejoin
scoreboard players reset @s loadingTimer
scoreboard players reset @s cinematic

tellraw @s[scores={cool=1}] [{text:"\nWelcome back! It looks like you played a previous version of Destroy. As a token of appreciation, you will have a special hat in game.",color:"green",type:"text"}]
scoreboard players set @s[scores={cool=1}] cool 2

return 1