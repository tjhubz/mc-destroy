particle minecraft:smoke ~15 ~ ~15 1 1 6 0 10 normal
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=4,dz=30,team=tutorial] at @s run tellraw @s [{"text":"WARNING ","color":"dark_red","bold":"true"},{"text":"The anticheat will kick you if you continue to do that.","color":"red","bold":"false"}]
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=4,dz=30,team=tutorial,gamemode=!creative] at @s run tp @s ~-1 4 ~
execute align xyz positioned ~14.5 ~ ~ run tag @a[dx=13,dy=4,dz=30,team=tutorial] add goback
tp @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] ~3 ~4 ~3
tag @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] remove goback

execute if entity @s[scores={tutorial=1}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=1}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1}] at @s run fill ~17 ~1 ~1 ~29 ~8 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=1}] at @s run fill ~1 ~ ~1 ~29 ~ ~29 minecraft:obsidian replace
execute if entity @s[scores={tutorial=1}] at @s run fill ~14 ~ ~1 ~16 ~ ~29 minecraft:barrier
execute if entity @s[scores={tutorial=1}] at @s run setblock ~3 ~5 ~17 minecraft:air destroy
execute if entity @s[scores={tutorial=1}] at @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run setblock ~ ~ ~ minecraft:air
execute if entity @s[scores={tutorial=1..699}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3
execute if entity @s[scores={tutorial=1}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=1}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Now, I've saved the best for last.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=5}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}

execute if entity @s[scores={tutorial=100}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~17 ~8.5 ~15
execute if entity @s[scores={tutorial=100}] at @s run fill ~17 ~8 ~1 ~29 ~8 ~29 minecraft:lime_concrete_powder replace
execute if entity @s[scores={tutorial=100}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=100}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"You're going to try and get up onto this platform!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=200}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=200}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"How, you ask?\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=300}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=300}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"With a player launcher of course!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=400}] at @s run fill ~5 ~3 ~13 ~9 ~3 ~17 minecraft:lime_concrete
execute if entity @s[scores={tutorial=400}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=400}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=400}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Let me show you.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=499}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~16
execute if entity @s[scores={tutorial=500}] at @s run clone 994 1 994 998 2 998 ~5 ~4 ~13
execute if entity @s[scores={tutorial=500}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=500}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"This right here is a basic player launcher.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=500}] at @s as @a[gamemode=!creative,dx=30,dy=100,dz=30,team=tutorial] run function help:4148e66d159ac8f6f50058a6fca11ea7d782f4eb876aeef43e867017a0a11d28
execute if entity @s[scores={tutorial=500..899}] at @s run tp @a[gamemode=!creative,dx=30,dy=100,dz=30,team=tutorial] ~15 ~11.5 ~2
execute if entity @s[scores={tutorial=500}] at @s at @a[gamemode=!creative,dx=30,dy=100,dz=30,team=tutorial] run setblock ~ ~-1 ~ minecraft:barrier
execute if entity @s[scores={tutorial=500..899}] at @s run function help:ee760a7cabf9304192b2befb1bfb6a9e091fc766170293ba5165785ce3452af9
execute if entity @s[scores={tutorial=500..899}] at @s run effect give @a[dx=30,dy=100,dz=30,team=tutorial] minecraft:invisibility 1 255 true

execute if entity @s[scores={tutorial=600}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=600}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Let me show you how it works.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=700}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=700}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"First, you press the button.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=700}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[349.0f,16.0f,10.0f],LeftLeg:[349.0f,0.0f,349.0f],RightLeg:[8.0f,0.0f,6.0f],LeftArm:[14.0f,0.0f,342.0f],RightArm:[329.0f,0.0f,140.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}
execute if entity @s[scores={tutorial=700}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run function help:1d68c06c0e3a2934fcf1f0b6bf0c60ba14e06d3de597da0ccab60db591b9271d
execute if entity @s[scores={tutorial=700}] at @s run setblock ~9 ~5 ~17 minecraft:stone_button[face=floor,powered=true]
execute if entity @s[scores={tutorial=700}] at @s run playsound minecraft:block.stone_button.click_on master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1

execute if entity @s[scores={tutorial=710}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}
execute if entity @s[scores={tutorial=720}] at @s run setblock ~9 ~5 ~17 minecraft:stone_button[face=floor,powered=false]

execute if entity @s[scores={tutorial=750}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run function help:a01e336dd0d6ff0ca01f23841247abf46d153bb944a19aaf0635aa87695597c5
execute if entity @s[scores={tutorial=750}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=750}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Then hop on and start jumping!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=760}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run tp @s ~ ~.5 ~
execute if entity @s[scores={tutorial=770}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run tp @s ~ ~.5 ~
execute if entity @s[scores={tutorial=780}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run tp @s ~ ~.5 ~

execute if entity @s[scores={tutorial=795}] at @s as @e[type=minecraft:tnt,dx=30,dy=100,dz=30] at @s run function main:server/util/explode_entity
execute if entity @s[scores={tutorial=790}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run data merge entity @s {Motion:[1.5d,2.5d,0.0d]}

execute if entity @s[scores={tutorial=810}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=810}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Wheeeee!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=900}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~17 ~8.5 ~15
execute if entity @s[scores={tutorial=900}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=900}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Now you try!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=900}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] run function help:63b86a2004056e646ee571ec4eb88dfe163637ab93082a85baa816c623bcec3b
execute if entity @s[scores={tutorial=850..}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3
execute if entity @s[scores={tutorial=900..903}] at @s run title @a[dx=30,dy=100,dz=30,team=tutorial] actionbar [{text:"Use the player launcher to get up onto the green platform.",color:"yellow",type:"text"}]
execute if entity @s[scores={tutorial=900..903}] at @s as @e[type=minecraft:tnt,dx=30,dy=100,dz=30] at @s unless block ~ ~ ~ minecraft:water run function main:server/util/explode_entity
execute if entity @s[scores={tutorial=900..903}] at @s at @a[dx=30,dy=100,dz=30,team=tutorial] if block ~ ~-1 ~ minecraft:lime_concrete_powder run scoreboard players set @s tutorial 904
execute if entity @s[scores={tutorial=903}] at @s run scoreboard players set @s tutorial 902

execute if entity @s[scores={tutorial=904}] at @s run playsound minecraft:entity.player.levelup master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 0
execute if entity @s[scores={tutorial=904}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Look at you! You're a tnt master!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=904..907}] at @s at @a[dx=30,dy=100,dz=30,team=tutorial] run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;238355],fade_colors:[I;392998],has_twinkle:1b}]}},count:1}}

execute if entity @s[scores={tutorial=1000}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1000}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"I think I've taught you all there is to know. Try out different tactics and have fun! If you forget something, I'll be here!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1000}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=1000}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1000}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1000}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=1000}] at @s run kill @e[type=minecraft:tnt,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=1000}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=1000}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] run function help:63b86a2004056e646ee571ec4eb88dfe163637ab93082a85baa816c623bcec3b

execute if entity @s[scores={tutorial=1150}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1150}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Goodbye!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1150}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[349.0f,16.0f,10.0f],LeftLeg:[349.0f,0.0f,349.0f],RightLeg:[8.0f,0.0f,6.0f],LeftArm:[14.0f,0.0f,342.0f],RightArm:[329.0f,0.0f,140.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}


execute if entity @s[scores={tutorial=1200..}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] at @s run function main:server/rejoin_player

return 1