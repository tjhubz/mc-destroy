execute as @e[type=minecraft:armor_stand,tag=penguin] at @s run function main:server/util/draw_circle
execute as @e[type=minecraft:armor_stand,tag=penguin] at @s run function help:a0efb3e53ca492b02c4a0e3e4844fc943adfef5834f2322bb2e155c4562eddb6
execute as @e[type=minecraft:armor_stand,tag=penguin] at @s if entity @s[x_rotation=90] at @s run function help:f321d55a5e62d61f6995758458ed6d301dcfab5e4f0e864569ef18fdf254f572
execute as @e[type=minecraft:armor_stand,tag=penguin] at @s unless entity @s[x_rotation=90] at @s run schedule function main:server/util/draw_sphere 1t
return 1