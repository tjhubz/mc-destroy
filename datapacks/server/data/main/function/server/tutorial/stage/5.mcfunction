particle minecraft:smoke ~19 ~ ~15 2 1 6 0 10 normal
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=4,dz=30,team=tutorial] at @s run tellraw @s [{"text":"WARNING ","color":"dark_red","bold":"true"},{"text":"The anticheat will kick you if you continue to do that.","color":"red","bold":"false"}]
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=4,dz=30,team=tutorial,gamemode=!creative] at @s run tp @s ~-1 4 ~
execute align xyz positioned ~14.5 ~ ~ run tag @a[dx=13,dy=2,dz=30,team=tutorial] add goback
tp @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] ~3 ~4 ~3
tag @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] remove goback

execute if entity @s[scores={tutorial=1}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=1}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1}] at @s run fill ~14 ~1 ~1 ~24 ~3 ~29 minecraft:air
execute if entity @s[scores={tutorial=1}] at @s run fill ~14 ~ ~1 ~24 ~ ~29 minecraft:barrier
execute if entity @s[scores={tutorial=1}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=1}] at @s run setblock ~3 ~5 ~17 minecraft:air destroy
execute if entity @s[scores={tutorial=1}] at @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run setblock ~ ~ ~ minecraft:air
execute if entity @s[scores={tutorial=1..699}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3
execute if entity @s[scores={tutorial=1}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=1}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Ok, so you wanna learn how to do the real cool stuff? Listen up!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=5}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}

execute if entity @s[scores={tutorial=100}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~25 ~3.5 ~15
execute if entity @s[scores={tutorial=100}] at @s run fill ~25 ~3 ~1 ~29 ~3 ~29 minecraft:lime_concrete_powder replace
execute if entity @s[scores={tutorial=100}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=100}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"So, in some gamemodes island crossing is allowed. This means you can get up close and personal to your enemies!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=200}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=200}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"I'm going to show you how to get over here so that you can put a sword to good use!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=300}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=300}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"We can do this by making a slime/honey machine that will carry you over.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=400}] at @s run fill ~4 ~4 ~12 ~11 ~4 ~18 minecraft:scaffolding
execute if entity @s[scores={tutorial=400}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=400}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=400}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Here, I'll show you what it looks like.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=499}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~6 ~5.5 ~16
execute if entity @s[scores={tutorial=500}] at @s run clone 984 1 972 987 1 976 ~6 ~5 ~13
execute if entity @s[scores={tutorial=500}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=500}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"This is the most basic design. I have both slime and honey here, but I prefer honey because it's easier.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=500}] at @s as @a[gamemode=!creative,dx=30,dy=100,dz=30,team=tutorial] run function help:4148e66d159ac8f6f50058a6fca11ea7d782f4eb876aeef43e867017a0a11d28
execute if entity @s[scores={tutorial=500..899}] at @s run tp @a[gamemode=!creative,dx=30,dy=100,dz=30,team=tutorial] ~15 ~11.5 ~2
execute if entity @s[scores={tutorial=500}] at @s at @a[gamemode=!creative,dx=30,dy=100,dz=30,team=tutorial] run setblock ~ ~-1 ~ minecraft:barrier
execute if entity @s[scores={tutorial=500..899}] at @s run function help:ee760a7cabf9304192b2befb1bfb6a9e091fc766170293ba5165785ce3452af9
execute if entity @s[scores={tutorial=500..899}] at @s run effect give @a[dx=30,dy=100,dz=30,team=tutorial] minecraft:invisibility 1 255 true

execute if entity @s[scores={tutorial=600}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=600}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Now, all you have to do is place a block behind the observer.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=700}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=700}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"And we're off!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=700}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[349.0f,16.0f,10.0f],LeftLeg:[349.0f,0.0f,349.0f],RightLeg:[8.0f,0.0f,6.0f],LeftArm:[14.0f,0.0f,342.0f],RightArm:[329.0f,0.0f,140.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}
execute if entity @s[scores={tutorial=700}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run function help:8fccbafd267bc79dbdcd5f4ff7b40bed3b25c55a1db1096fa3e5bea5e0535fe3
execute if entity @s[scores={tutorial=700}] at @s run setblock ~5 ~5 ~17 minecraft:gold_block

execute if entity @s[scores={tutorial=710}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}


execute if entity @s[scores={tutorial=750}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=750}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Then ride it to the other side!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=810}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=810}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Pretty epic, huh?\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=900}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~9 ~3.5 ~7
execute if entity @s[scores={tutorial=900}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=900}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Now, try and cross over to kill the sheep! Right click the wrench if you want to reset.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=900}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] run function help:63b86a2004056e646ee571ec4eb88dfe163637ab93082a85baa816c623bcec3b
execute if entity @s[scores={tutorial=900..}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3

execute if entity @s[scores={tutorial=901}] at @s run tp @e[type=minecraft:sheep,dx=30,dy=100,dz=30,tag=tutorial] ~ ~-1000 ~
execute if entity @s[scores={tutorial=901}] at @s run summon minecraft:sheep ~27 ~3.5 ~15 {Tags:["tutorial"],Health:1.0f,NoAI:1b,Rotation:[90.0f,0.0f],Silent:1b}
execute if entity @s[scores={tutorial=901}] at @s run scoreboard players reset @a[dx=30,dy=100,dz=30,team=tutorial] wrench
execute if entity @s[scores={tutorial=901}] at @s run setblock ~5 ~4 ~13 minecraft:lime_concrete replace
execute if entity @s[scores={tutorial=901}] at @s run setblock ~5 ~4 ~17 minecraft:lime_concrete replace
execute if entity @s[scores={tutorial=901}] at @s run fill ~1 ~5 ~1 ~29 ~6 ~29 minecraft:air
execute if entity @s[scores={tutorial=901}] at @s run clone 984 1 972 987 1 976 ~6 ~5 ~13
execute if entity @s[scores={tutorial=901}] at @s run loot replace entity @a[dx=30,dy=100,dz=30,team=tutorial] hotbar.0 mine 992 1 1000 minecraft:diamond_pickaxe[minecraft:custom_data={drop_contents:1b}]
execute if entity @s[scores={tutorial=901}] at @s run item replace entity @a[dx=30,dy=100,dz=30,team=tutorial] hotbar.8 with minecraft:warped_fungus_on_a_stick[minecraft:custom_name={text:"Wrench ",color:"yellow",extra:[{text:"(Right Click)",color:"gray",italic:1b}]},minecraft:item_name={extra:["Wrench (Right Click)"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable","minecraft:can_break","minecraft:can_place_on","minecraft:stored_enchantments"]}] 1

execute if entity @s[scores={tutorial=902..903}] at @s if entity @a[dx=30,dy=100,dz=30,scores={wrench=1..},team=tutorial] run scoreboard players set @s tutorial 900
execute if entity @s[scores={tutorial=902..903}] at @s run title @a[dx=30,dy=100,dz=30,team=tutorial] actionbar [{text:"Use the gold blocks to activate a slime machine to cross over and kill the sheep.",color:"yellow",type:"text"}]
execute if entity @s[scores={tutorial=902..903}] at @s positioned ~5 ~5 ~13 if block ~ ~ ~ minecraft:air run particle minecraft:happy_villager ~ ~ ~ 0 0 0 0 1
execute if entity @s[scores={tutorial=902..903}] at @s positioned ~5 ~5 ~17 if block ~ ~ ~ minecraft:air run particle minecraft:happy_villager ~ ~ ~ 0 0 0 0 1
execute if entity @s[scores={tutorial=902..903}] at @s unless entity @e[type=minecraft:sheep,dx=30,dy=100,dz=30,tag=tutorial] run scoreboard players set @s tutorial 904
execute if entity @s[scores={tutorial=903}] at @s run scoreboard players set @s tutorial 902

execute if entity @s[scores={tutorial=904}] at @s run clear @a[dx=30,dy=100,dz=30,team=tutorial]
execute if entity @s[scores={tutorial=904}] at @s run playsound minecraft:entity.player.levelup master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 0
execute if entity @s[scores={tutorial=904}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Hey, nice job!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=904..907}] at @s at @a[dx=30,dy=100,dz=30,team=tutorial] run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;238355],fade_colors:[I;392998],has_twinkle:1b}]}},count:1}}

execute if entity @s[scores={tutorial=1000}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1000}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Let's move on.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1000}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=1000}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1000}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1000}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=1000}] at @s run kill @e[type=minecraft:tnt,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=1000}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=1000}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] run function help:63b86a2004056e646ee571ec4eb88dfe163637ab93082a85baa816c623bcec3b

execute if entity @s[scores={tutorial=1100..}] at @s run function main:server/tutorial/next_stage

return 1