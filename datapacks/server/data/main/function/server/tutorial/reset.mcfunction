tag @s remove active
tag @s remove place_water
scoreboard players set @s tutorial 0
scoreboard players set @s tutorial_stage 0
kill @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim]
kill @e[type=minecraft:text_display,dx=30,dy=100,dz=30,tag=repeater_display]
kill @e[type=minecraft:shulker,dx=30,dy=100,dz=30]
kill @e[type=minecraft:sheep,dx=30,dy=100,dz=30]
kill @e[type=minecraft:area_effect_cloud,dx=30,dy=100,dz=30]
kill @e[type=minecraft:marker,dx=30,dy=100,dz=30]
kill @e[type=minecraft:tnt,dx=30,dy=100,dz=30]
kill @e[type=minecraft:block_display,dx=30,dy=100,dz=30]

#summon minecraft:area_effect_cloud ~ ~1 ~ {Duration:2000,Tags:["reset_tutorial"]}
#execute as @e[type=area_effect_cloud,tag=reset_tutorial] at @s run function main:server/tutorial/clear

fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
fill ~1 ~31 ~1 ~29 ~60 ~29 minecraft:air replace
fill ~1 ~61 ~1 ~29 ~95 ~29 minecraft:air replace
fill ~1 ~ ~1 ~29 ~ ~29 minecraft:obsidian replace
fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
summon minecraft:armor_stand ~9 ~4 ~7 {Invulnerable:1b,Rotation:[120.0f,0.0f],Tags:["tim"],NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[74.0f,6.0f,8.0f],LeftLeg:[288.0f,350.0f,360.0f],RightLeg:[286.0f,14.0f,0.0f],LeftArm:[0.0f,0.0f,354.0f],RightArm:[360.0f,0.0f,6.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}
fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
fill ~14 ~ ~1 ~16 ~ ~29 minecraft:barrier

return 1