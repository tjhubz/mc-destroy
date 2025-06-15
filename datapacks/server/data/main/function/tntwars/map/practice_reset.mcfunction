forceload add -550 -549

execute as @e[type=minecraft:armor_stand,tag=practiceReset] at @s if block ~ ~ ~ minecraft:lapis_block run tellraw @a[dx=100,dy=-100,dz=100] [{text:"\nPractice area resetting...\n",type:"text"}]

execute as @e[type=minecraft:armor_stand,tag=practiceReset] at @s run fill ~1 ~ ~1 ~99 ~ ~99 minecraft:air replace
execute as @e[type=minecraft:armor_stand,tag=practiceReset] at @s run tp @s ~ ~-1 ~

execute as @e[type=minecraft:armor_stand,tag=practiceReset] at @s if block ~ ~ ~ minecraft:air run schedule function main:tntwars/map/practice_reset 10t replace

execute as @e[type=minecraft:armor_stand,tag=practiceReset] at @s if block ~ ~ ~ minecraft:obsidian run schedule function main:tntwars/map/practice_reset 900s replace
execute as @e[type=minecraft:armor_stand,tag=practiceReset] at @s if block ~ ~ ~ minecraft:obsidian run tp @s ~ 50 ~
return 1