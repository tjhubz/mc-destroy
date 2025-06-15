execute if entity @e[distance=..1.5,tag=tutorial_start1] run tag @s add t_basic
execute if entity @e[distance=..1.5,tag=tutorial_start2] run tag @s add t_intermediate
execute if entity @e[distance=..1.5,tag=tutorial_start3] run tag @s add t_advanced

execute if entity @s[distance=..5] if entity @s[tag=!t_basic,tag=!t_intermediate,tag=!t_advanced] positioned ^ ^ ^.5 run function main:server/tutorial/select

execute if entity @s[tag=t_basic] at @s run function main:server/tutorial/start/basic
execute if entity @s[tag=t_intermediate] at @s run function main:server/tutorial/start/intermediate
execute if entity @s[tag=t_advanced] at @s run function main:server/tutorial/start/advanced

return 1