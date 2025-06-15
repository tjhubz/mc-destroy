execute at @s unless block ~ ~ ~ minecraft:air run tp @s ~ ~1 ~
execute at @s if block ~ ~ ~ minecraft:air run spawnpoint @s ~ ~ ~ ~

execute at @s unless block ~ ~ ~ minecraft:air run function main:tntwars/util/spawnpoint
return 1