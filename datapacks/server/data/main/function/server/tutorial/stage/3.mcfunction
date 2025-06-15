particle minecraft:smoke ~15 ~ ~15 1 1 6 0 10 normal
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=100,dz=30,team=tutorial] at @s run tellraw @s [{"text":"WARNING ","color":"dark_red","bold":"true"},{"text":"The anticheat will kick you if you continue to do that.","color":"red","bold":"false"}]
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=100,dz=30,team=tutorial,gamemode=!creative] at @s run tp @s ~-.5 4 ~
execute align xyz positioned ~14.5 ~ ~ run tag @a[dx=13,dy=100,dz=30,team=tutorial] add goback
tp @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] ~3 ~4 ~3
tag @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] remove goback

execute if entity @s[scores={tutorial=1}] at @s run setblock ~3 ~5 ~17 minecraft:air destroy
execute if entity @s[scores={tutorial=1}] at @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run setblock ~ ~ ~ minecraft:air
execute if entity @s[scores={tutorial=1..49}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:1f07643b213f1198de5aef133b9cf8b5528b395d2e003a81279d02ff7667ad70
execute if entity @s[scores={tutorial=50..399}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3
execute if entity @s[scores={tutorial=1}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=1}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"You see that sheep over there? He's mocking you. Let's get him!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1}] at @s run clone 988 1 986 992 1 990 ~21 ~3 ~13
execute if entity @s[scores={tutorial=1}] at @s run summon minecraft:sheep ~23 ~3.5 ~15 {Tags:["tutorial"],Health:1.0f,NoAI:1b,Rotation:[90.0f,0.0f],Silent:1b}
execute if entity @s[scores={tutorial=1}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}

execute if entity @s[scores={tutorial=100}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=100}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"Load the cannon with tnt just like the other one! Right click the wrench if you make a mistake.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=100..101}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=101}] at @s run clone 974 1 992 982 2 998 ~3 ~4 ~12
execute if entity @s[scores={tutorial=101}] at @s run scoreboard players reset @a[dx=30,dy=100,dz=30,team=tutorial] wrench
execute if entity @s[scores={tutorial=101}] at @s run clear @a[dx=30,dy=100,dz=30,team=tutorial]
execute if entity @s[scores={tutorial=101}] at @s run give @a[dx=30,dy=100,dz=30,team=tutorial] minecraft:tnt[minecraft:can_break=[{blocks:"minecraft:tnt"}],minecraft:can_place_on=[{blocks:["minecraft:stone_bricks","minecraft:stone_brick_slab","minecraft:lime_concrete","minecraft:tnt"]}]] 7
execute if entity @s[scores={tutorial=100..103}] at @s run item replace entity @a[dx=30,dy=100,dz=30,team=tutorial] hotbar.8 with minecraft:warped_fungus_on_a_stick[minecraft:custom_name={text:"Wrench ",color:"yellow",extra:[{text:"(Right Click)",color:"gray",italic:1b}]},minecraft:item_name={extra:["Wrench (Right Click)"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable","minecraft:can_break","minecraft:can_place_on","minecraft:stored_enchantments"]}] 1
execute if entity @s[scores={tutorial=101..103}] at @s if block ~4 ~4 ~13 minecraft:tnt run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"Careful! we want the water there!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=101..103}] at @s if block ~4 ~4 ~13 minecraft:tnt run scoreboard players set @a[dx=30,dy=100,dz=30,team=tutorial] break_tnt 1
execute if entity @s[scores={tutorial=101..103}] at @s if block ~4 ~4 ~13 minecraft:tnt run setblock ~4 ~4 ~13 minecraft:water
execute if entity @s[scores={tutorial=101..103}] at @s run kill @e[type=minecraft:tnt,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=101..103}] at @s unless blocks 974 1 996 982 2 998 ~3 ~4 ~16 masked run tag @a[dx=30,dy=100,dz=30,team=tutorial] remove break_active
execute if entity @s[scores={tutorial=101..103}] at @s unless blocks 974 1 996 982 2 998 ~3 ~4 ~16 masked run clone 974 1 996 982 2 998 ~3 ~4 ~16
execute if entity @s[scores={tutorial=101..103}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] run function main:server/tutorial/break_block
execute if entity @s[scores={tutorial=101..103}] at @s if entity @a[dx=30,dy=100,dz=30,scores={wrench=1..},team=tutorial] run scoreboard players set @s tutorial 100
execute if entity @s[scores={tutorial=101..103}] at @s run title @a[dx=30,dy=100,dz=30,team=tutorial] actionbar [{text:"Right click the wrench to reset the build if you make a mistake.",color:"yellow",type:"text"}]
execute if entity @s[scores={tutorial=102..103}] at @s if blocks ~3 ~4 ~16 ~11 ~5 ~18 ~3 ~4 ~12 masked run scoreboard players set @s tutorial 104
execute if entity @s[scores={tutorial=103}] at @s run scoreboard players set @s tutorial 102

execute if entity @s[scores={tutorial=104}] at @s run tag @a[dx=30,dy=100,dz=30,team=tutorial] remove break_active
execute if entity @s[scores={tutorial=104}] at @s run clear @a[dx=30,dy=100,dz=30,team=tutorial]
execute if entity @s[scores={tutorial=104}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=104}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"Locked and loaded. You may fire when ready.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=104}] at @s run particle minecraft:flame ~7 ~5 ~15 2 1 3 0.01 100
execute if entity @s[scores={tutorial=104}] at @s run setblock ~3 ~5 ~13 minecraft:stone_button[face=floor]
execute if entity @s[scores={tutorial=104}] at @s run setblock ~3 ~5 ~17 minecraft:stone_button[face=floor]
execute if entity @s[scores={tutorial=105..106}] at @s positioned ~14 ~ ~ run tp @e[type=minecraft:tnt,dx=14,dy=100,dz=30,nbt={fuse:1s}] @e[type=minecraft:sheep,dx=30,dy=100,dz=30,limit=1]
execute if entity @s[scores={tutorial=105..106}] at @s unless entity @e[type=minecraft:sheep,dx=30,dy=100,dz=30] run scoreboard players set @s tutorial 107
execute if entity @s[scores={tutorial=106}] at @s run scoreboard players set @s tutorial 105

execute if entity @s[scores={tutorial=107}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=107}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"Nice! Got 'em!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=107}] at @s run kill @e[type=minecraft:tnt,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=107}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=107}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=107}] at @s run fill ~3 ~3 ~12 ~11 ~3 ~14 minecraft:gray_concrete

execute if entity @s[scores={tutorial=200}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=200}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"In tnt wars, you win the game if the other sheep dies! But at the same time, you have to protect your own sheep.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=300}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=300}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"Let's see how good you are at defending your own sheep.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=400}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=400}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"I'm going to randomly fire these cannons. Make sure the sheep survives! Use the lead to help the sheep avoid the tnt. I'll get started as soon as you attach the lead to the sheep.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=400}] at @s run particle minecraft:explosion ~17 ~5 ~15 2 1 5 1 100
execute if entity @s[scores={tutorial=400}] at @s run clone 977 1 964 982 2 990 ~20 ~4 ~2
execute if entity @s[scores={tutorial=400}] at @s run clone 990 1 972 992 3 976 ~27 ~6 ~13
execute if entity @s[scores={tutorial=400}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run function help:7777f7cbe94d96356b0ef91e957659c6bbf8ec861dc4b7ef89d07fcf8ff671c2
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:sheep ~7 ~4 ~15 {Health:20.0f,Silent:1b,Color:5b,Tags:["tutorial"]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:marker ~25 ~5 ~4 {Tags:["tutorial_cannon"]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:marker ~25 ~5 ~8 {Tags:["tutorial_cannon"]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:marker ~25 ~5 ~12 {Tags:["tutorial_cannon"]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:marker ~25 ~5 ~16 {Tags:["tutorial_cannon"]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:marker ~25 ~5 ~20 {Tags:["tutorial_cannon"]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:marker ~25 ~5 ~24 {Tags:["tutorial_cannon"]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:marker ~25 ~5 ~28 {Tags:["tutorial_cannon"]}
execute if entity @s[scores={tutorial=400..}] at @s align xyz positioned ~14.5 ~ ~ as @e[type=minecraft:sheep,dx=13,dy=100,dz=30,tag=tutorial] at @s run tp @s ~-.5 4 ~
execute if entity @s[scores={tutorial=400..999}] at @s run item replace entity @a[dx=30,dy=100,dz=30,team=tutorial] hotbar.0 with minecraft:lead[minecraft:custom_name={text:"Right click on the sheep to with use!",color:"yellow"},minecraft:item_name={extra:["Right click on the sheep to with use!"],text:"EMU"}] 1
execute if entity @s[scores={tutorial=400..999}] at @s run effect give @a[dx=30,dy=100,dz=30,team=tutorial] minecraft:weakness 1 255 true
execute if entity @s[scores={tutorial=401..403}] at @s store success score @s temp run data get entity @e[type=minecraft:sheep,dx=30,dy=100,dz=30,tag=tutorial,sort=nearest,limit=1] leash
execute if entity @s[scores={tutorial=401..403}] at @s if score @s temp matches 1 run scoreboard players set @s tutorial 500
execute if entity @s[scores={tutorial=403}] at @s run scoreboard players set @s tutorial 402

execute if entity @s[scores={tutorial=404}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=404}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"Whoopsies! The sheep died. Let's try again. Remember, you must lead the sheep away from the tnt! I'll get started when you attach the lead to the sheep.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=404}] at @s run kill @e[type=minecraft:tnt,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=404}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] run function help:63b86a2004056e646ee571ec4eb88dfe163637ab93082a85baa816c623bcec3b
execute if entity @s[scores={tutorial=404}] at @s run summon minecraft:sheep ~7 ~4 ~15 {Health:40.0f,Silent:1b,Color:5b,Tags:["tutorial"]}
execute if entity @s[scores={tutorial=404}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=404}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=404}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=404}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=404}] at @s run clone 977 1 964 982 2 990 ~20 ~4 ~2
execute if entity @s[scores={tutorial=404}] at @s run clone 990 1 972 992 3 976 ~27 ~6 ~13
execute if entity @s[scores={tutorial=404}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run function help:7777f7cbe94d96356b0ef91e957659c6bbf8ec861dc4b7ef89d07fcf8ff671c2
execute if entity @s[scores={tutorial=404}] at @s run scoreboard players set @s tutorial 402

execute if entity @s[scores={tutorial=500}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=500}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"Alright, you ready? Here comes the tnt!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=500..1000}] at @s positioned ~14 ~ ~ as @e[type=minecraft:tnt,dx=14,dy=100,dz=30,nbt={fuse:1s}] at @s unless block ~ ~ ~ minecraft:water run function main:server/util/explode_entity
execute if entity @s[scores={tutorial=500..999}] at @s unless entity @e[type=minecraft:sheep,dx=30,dy=100,dz=30,tag=tutorial] run scoreboard players set @s tutorial 403

execute if entity @s[scores={tutorial=550}] at @s run function main:server/tutorial/press_button
#execute as @s[scores={tutorial=600}] at @s run function main:server/tutorial/press_button
execute if entity @s[scores={tutorial=650}] at @s run function main:server/tutorial/press_button
#execute as @s[scores={tutorial=700}] at @s run function main:server/tutorial/press_button
execute if entity @s[scores={tutorial=750}] at @s run function main:server/tutorial/press_button
#execute as @s[scores={tutorial=800}] at @s run function main:server/tutorial/press_button
execute if entity @s[scores={tutorial=850}] at @s run function main:server/tutorial/press_button

execute if entity @s[scores={tutorial=1000}] at @s run clear @a[dx=30,dy=100,dz=30,team=tutorial]
execute if entity @s[scores={tutorial=1000}] at @s run kill @e[type=minecraft:leash_knot,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=1000}] at @s run tp @e[type=minecraft:sheep,dx=30,dy=100,dz=30] ~ ~-1000 ~
execute if entity @s[scores={tutorial=1000}] at @s run kill @e[type=minecraft:tnt,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=1000}] at @s run kill @e[type=minecraft:area_effect_cloud,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=1000}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] run function help:63b86a2004056e646ee571ec4eb88dfe163637ab93082a85baa816c623bcec3b
execute if entity @s[scores={tutorial=1000}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=1000}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1000}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1000}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=1000}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=1000}] at @s run playsound minecraft:entity.player.levelup master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1000}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"You did it! Great job. Now you know the basics of how to play TNT Wars!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1000..}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3

execute if entity @s[scores={tutorial=1100}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1100}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"Now, go have some fun! You can always come back if you want to do the tutorial again or learn about other stuff.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1100}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}

execute if entity @s[scores={tutorial=1200}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1200}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTIM ",color:"green",bold:1b,type:"text"},{text:"Goodbye!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1200}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[349.0f,16.0f,10.0f],LeftLeg:[349.0f,0.0f,349.0f],RightLeg:[8.0f,0.0f,6.0f],LeftArm:[14.0f,0.0f,342.0f],RightArm:[329.0f,0.0f,140.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}


execute if entity @s[scores={tutorial=1250..}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] at @s run function main:server/rejoin_player

return 1