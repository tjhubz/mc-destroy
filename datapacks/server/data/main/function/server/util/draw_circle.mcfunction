execute as @e[type=minecraft:armor_stand,tag=penguin] at @s run particle minecraft:dripping_lava ^ ^ ^1 0 0 0 0 1
execute as @e[type=minecraft:armor_stand,tag=penguin] at @s run function help:1b836f036fb6baee2fe464caf3c378653972a2b76cfaaecd388aaa3e133433ab
execute as @e[type=minecraft:armor_stand,tag=penguin] at @s unless entity @s[y_rotation=0..4] at @s run schedule function main:server/util/draw_circle 1t
return 1