scoreboard players set #rotate help.value 0
execute if entity @s[type=!minecraft:player] on vehicle run scoreboard players set #rotate help.value 1
execute if score #rotate help.value matches 0 run return run teleport @s ~ ~ ~ facing entity @p[team=tutorial]
return run rotate @s facing entity @p[team=tutorial]