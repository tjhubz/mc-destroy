execute if entity @e[type=minecraft:armor_stand,tag=blueSpawn] as @a[team=blue] at @s run function main:tntwars/teams/blue
execute if entity @e[type=minecraft:armor_stand,tag=redSpawn] as @a[team=red] at @s run function main:tntwars/teams/red
execute if entity @e[type=minecraft:armor_stand,tag=yellowSpawn] as @a[team=yellow] at @s run function main:tntwars/teams/yellow
execute if entity @e[type=minecraft:armor_stand,tag=whiteSpawn] as @a[team=white] at @s run function main:tntwars/teams/white

return 1