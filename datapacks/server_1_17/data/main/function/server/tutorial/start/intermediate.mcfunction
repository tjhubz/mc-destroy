tag @s add start_tutorial
tag @s remove t_intermediate
playsound minecraft:ui.button.click master @s ~ ~1000 ~ 100000 1
execute as @e[type=minecraft:armor_stand,tag=tutorial,tag=!active,sort=random,limit=1] at @s run function main:server/tutorial/start/common
execute as @e[type=minecraft:armor_stand,tag=start_tutorial] run scoreboard players set @s tutorial_stage 4

tag @e[tag=start_tutorial] remove start_tutorial

return 1