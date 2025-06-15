
#execute as @a at @s run playsound minecraft:block.note_block.bit master @s ~ ~100 ~ 1000 2
execute as @a run tellraw @s [{text:"[DESTROY] ",color:"light_purple",type:"text"},{text:"Game code reloaded!",color:"gray",type:"text"}]

team add yellow
team add white
team add red
team add blue
team add tutorial

team modify white color gray
team modify yellow color yellow
team modify blue color blue
team modify red color red

team modify white collisionRule never
team modify yellow collisionRule never
team modify red collisionRule never
team modify blue collisionRule never

team modify white friendlyFire false
team modify yellow friendlyFire false
team modify red friendlyFire false
team modify blue friendlyFire false

team modify tutorial color green
team modify tutorial collisionRule never
team modify tutorial nametagVisibility hideForOwnTeam

forceload add -550 -549
#execute unless entity @a run scoreboard players set *map settings 1
#execute unless entity @a run function main:tntwars/map/map1
#execute unless entity @a run function main:tntwars/settings/classic
#execute unless entity @a run function main:tntwars/map/practice_reset

return 1