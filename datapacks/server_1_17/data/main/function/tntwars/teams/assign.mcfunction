execute if block ~ ~ ~ minecraft:stone_button[powered=true] run team join main @a[gamemode=adventure,tag=queue]
setblock ~ ~ ~ minecraft:stone_button[face=floor,powered=false] replace

execute if entity @e[type=minecraft:armor_stand,tag=blueSpawn] as @r[gamemode=adventure,team=main] at @s run team join blue
execute if entity @e[type=minecraft:armor_stand,tag=redSpawn] as @r[gamemode=adventure,team=main] at @s run team join red
execute if entity @e[type=minecraft:armor_stand,tag=yellowSpawn] as @r[gamemode=adventure,team=main] at @s run team join yellow
execute if entity @e[type=minecraft:armor_stand,tag=whiteSpawn] as @r[gamemode=adventure,team=main] at @s run team join white

execute if entity @a[gamemode=adventure,team=main] run function main:tntwars/teams/assign
execute unless entity @a[gamemode=adventure,team=main] run playsound minecraft:block.note_block.pling master @a[gamemode=adventure,team=!tutorial] ~ ~10000 ~ 100000 1
execute unless entity @a[gamemode=adventure,team=main] run tag @a[gamemode=adventure,team=!tutorial] add queue
execute unless entity @a[gamemode=adventure,team=main] run title @a[gamemode=adventure,team=!tutorial] actionbar [{text:"Teams have been randomized!",color:"green",type:"text"}]

return 1