scoreboard players add @s[scores={tutorial_stage=1..}] tutorial 1
kill @e[type=minecraft:item,dx=30,dy=100,dz=30,nbt={Item:{id:"minecraft:warped_fungus_on_a_stick"}}]
kill @e[type=minecraft:item,dx=30,dy=100,dz=30,nbt={Item:{id:"minecraft:lead"}}]
effect give @a[dx=30,dy=100,dz=30,team=tutorial] minecraft:resistance infinite 255 true
execute as @a[gamemode=spectator,distance=..50,tag=!settings,team=!tutorial] at @s run tp @s 0 10 0
forceload add ~ ~ ~30 ~30

execute if entity @s[scores={tutorial_stage=1}] at @s run function main:server/tutorial/stage/1
execute if entity @s[scores={tutorial_stage=2}] at @s run function main:server/tutorial/stage/2
execute if entity @s[scores={tutorial_stage=3}] at @s run function main:server/tutorial/stage/3
execute if entity @s[scores={tutorial_stage=4}] at @s run function main:server/tutorial/stage/4
execute if entity @s[scores={tutorial_stage=5}] at @s run function main:server/tutorial/stage/5
execute if entity @s[scores={tutorial_stage=6}] at @s run function main:server/tutorial/stage/6

execute unless entity @a[dx=30,dy=100,dz=30,team=tutorial] run function main:server/tutorial/reset

return 1