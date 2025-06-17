particle minecraft:smoke ~15 ~ ~15 1 1 6 0 10 normal
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=100,dz=30,team=tutorial] at @s run tellraw @s [{"text":"WARNING ","color":"dark_red","bold":"true"},{"text":"The anticheat will kick you if you continue to do that.","color":"red","bold":"false"}]
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=100,dz=30,team=tutorial] at @s run tp @s ~-2 4 ~
execute align xyz positioned ~14.5 ~ ~ run tag @a[dx=13,dy=100,dz=30,team=tutorial] add goback
tp @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] ~3 ~4 ~3
tag @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] remove goback

execute if entity @s[scores={tutorial=1}] at @s run effect give @a[dx=30,dy=100,dz=30,team=tutorial] minecraft:blindness 2 0 true

execute if entity @s[scores={tutorial=40}] at @s run playsound minecraft:entity.experience_orb.pickup master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 2
execute if entity @s[scores={tutorial=40}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nOh no! Look at that broken robot over there! Go fix him up!",color:"yellow",type:"text"}]
execute if entity @s[scores={tutorial=41}] at @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run particle minecraft:lava ~ ~ ~ 0 0 0 1 0 normal

execute if entity @s[scores={tutorial=40..60}] at @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run item replace entity @a[distance=..3,team=tutorial] hotbar.0 with minecraft:warped_fungus_on_a_stick[minecraft:custom_name={text:"Wrench ",color:"yellow",extra:[{text:"(Right Click)",color:"gray",italic:1b}]},minecraft:item_name={extra:["Wrench (Right Click)"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable","minecraft:can_break","minecraft:can_place_on","minecraft:stored_enchantments"]}] 1
execute if entity @s[scores={tutorial=40..60}] at @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run setblock ~ ~ ~ minecraft:barrier
execute if entity @s[scores={tutorial=40..60}] as @a[dx=30,dy=100,dz=30,scores={wrench=1..},team=tutorial] at @s run playsound minecraft:block.anvil.use master @s ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=40..60}] if entity @a[dx=30,dy=100,dz=30,scores={wrench=1..},team=tutorial] run scoreboard players set @s tutorial 61
execute if entity @s[scores={tutorial=60}] at @s run scoreboard players set @s tutorial 40

execute if entity @s[scores={tutorial=61..}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3
execute if entity @s[scores={tutorial=61..65}] at @s run scoreboard players reset @a[dx=30,dy=100,dz=30,scores={wrench=1..}] wrench
execute if entity @s[scores={tutorial=61..65}] at @s run clear @a[dx=30,dy=100,dz=30,team=tutorial] minecraft:warped_fungus_on_a_stick
execute if entity @s[scores={tutorial=61}] at @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run particle minecraft:firework ~ ~.5 ~ 0 0 0 .1 50
execute if entity @s[scores={tutorial=61}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}

execute if entity @s[scores={tutorial=100}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=100}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Gee thanks!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=200}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=200}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"The name's Tim. I'm the tutorial robot! Nice to meet you.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=200}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[349.0f,16.0f,10.0f],LeftLeg:[349.0f,0.0f,349.0f],RightLeg:[8.0f,0.0f,6.0f],LeftArm:[14.0f,0.0f,342.0f],RightArm:[329.0f,0.0f,140.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}

execute if entity @s[scores={tutorial=300}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=300}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"I'm here to teach you how to play TNT Wars!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=300}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}

execute if entity @s[scores={tutorial=400}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=400}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Let's get started!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=500}] at @s run function main:server/tutorial/next_stage

return 1