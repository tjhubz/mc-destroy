scoreboard players set #rotate help.value 0
execute if entity @s[type=!minecraft:player] on vehicle run scoreboard players set #rotate help.value 1
execute if score #rotate help.value matches 0 run return run teleport @s ~ ~ ~ facing entity @e[type=minecraft:sheep,sort=nearest,limit=1]
return run rotate @s facing entity @e[type=minecraft:sheep,sort=nearest,limit=1]