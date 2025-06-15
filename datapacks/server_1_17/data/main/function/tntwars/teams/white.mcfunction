scoreboard players reset @s shotArrow
scoreboard players reset @s shotTrident
scoreboard players reset @s damage
scoreboard players reset @s powerCooldown
tag @s remove oneshot
tag @s remove inGame
tag @s remove editing

scoreboard players operation @s game_id = *current_id game_id
tag @s[tag=queue] remove queue
clear @s
function help:b1b7b32c383cf7c8ae900b807469e3bc552abb04df1f75545c9693e4e338107d
particle minecraft:large_smoke ~ ~1 ~ 0.1 0.5 0.1 0 15
playsound minecraft:entity.enderman.teleport master @s ~ ~100 ~ 255 1
execute if score tntwars_timer global matches 6.. run tellraw @a[team=white] [{selector:"@s",color:"gray",type:"selector"},{text:" joined your team.",color:"gray",type:"text"}]
team join white @s
tag @s add tntwars
tag @s add alive
gamemode survival @s
tp @s @e[type=minecraft:armor_stand,tag=whiteSpawn,limit=1]
execute at @e[type=minecraft:armor_stand,tag=whiteSpawn,limit=1] run spawnpoint @s ~ ~ ~ ~
function main:tntwars/util/get_items

return 1