execute if entity @s[tag=reset_tutorial] at @s run tp @s ~ ~1 ~
execute if entity @s[tag=reset_tutorial] at @s if block ~ ~ ~ minecraft:obsidian run fill ~1 ~ ~1 ~29 ~ ~29 minecraft:air replace minecraft:water
execute if entity @s[tag=reset_tutorial] at @s if block ~ ~ ~ minecraft:obsidian run fill ~1 ~ ~1 ~29 ~ ~29 minecraft:air replace minecraft:stone_bricks
execute if entity @s[tag=reset_tutorial] at @s if block ~ ~ ~ minecraft:air run kill @s

#execute as @s[tag=reset_tutorial] at @s run function main:server/tutorial/clear

return 1