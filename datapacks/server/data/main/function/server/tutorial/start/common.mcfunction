tag @s add active
tag @s add start_tutorial
execute as @p[tag=start_tutorial] run function help:63b86a2004056e646ee571ec4eb88dfe163637ab93082a85baa816c623bcec3b
team join tutorial @p[tag=start_tutorial]
gamemode adventure @p[tag=start_tutorial]
clear @p[tag=start_tutorial]
scoreboard players reset @a[tag=start_tutorial] wrench
tag @a[tag=start_tutorial] remove queue
effect give @a[tag=start_tutorial] minecraft:blindness 2 0 true

return 1