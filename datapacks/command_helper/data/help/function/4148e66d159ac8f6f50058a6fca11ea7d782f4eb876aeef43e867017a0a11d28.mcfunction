scoreboard players set #rotate help.value 0
execute if entity @s[type=!minecraft:player] on vehicle run scoreboard players set #rotate help.value 1
execute if score #rotate help.value matches 0 run return run teleport @s ~15 ~11.5 ~2 facing entity @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim,limit=1]
return run rotate @s facing entity @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim,limit=1]