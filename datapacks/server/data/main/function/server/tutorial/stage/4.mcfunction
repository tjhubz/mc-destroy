particle minecraft:smoke ~15 ~ ~15 1 1 6 0 10 normal
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=100,dz=30,team=tutorial] at @s run tellraw @s [{"text":"WARNING ","color":"dark_red","bold":"true"},{"text":"The anticheat will kick you if you continue to do that.","color":"red","bold":"false"}]
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=100,dz=30,team=tutorial,gamemode=!creative] at @s run tp @s ~-.5 4 ~
execute align xyz positioned ~14.5 ~ ~ run tag @a[dx=13,dy=100,dz=30,team=tutorial] add goback
tp @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] ~3 ~4 ~3
tag @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] remove goback

execute if entity @s[scores={tutorial=1}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=1}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=1}] at @s run setblock ~3 ~5 ~17 minecraft:air destroy
execute if entity @s[scores={tutorial=1}] at @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run setblock ~ ~ ~ minecraft:air
execute if entity @s[scores={tutorial=1..403}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3
execute if entity @s[scores={tutorial=1}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=1}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Hey there! Let's check out some intermediate cannons!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=5}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}

execute if entity @s[scores={tutorial=100}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=100}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"This cannon uses dispensers instead of manually placing tnt. It makes it much easier to fire frequently!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=100}] at @s positioned ~3 ~4 ~14 run tag @a[dx=8,dy=100,dz=2] add tp
execute if entity @s[scores={tutorial=100}] at @s as @a[dx=30,dy=100,dz=30,tag=tp] run function help:14857a78d989a4d86cadadc93adc20637c7a9eca8484a866a4a12f5b8757f8a4
execute if entity @s[scores={tutorial=100}] at @s run tag @a[dx=30,dy=100,dz=30,tag=tp] remove tp
execute if entity @s[scores={tutorial=100}] at @s run clone 984 1 982 992 4 984 ~3 ~4 ~14

execute if entity @s[scores={tutorial=200}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=200}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"You will notice there's no repeaters, which means you will have to manually press the button + lever to fire the cannon.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=300}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=300}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Let's try firing it. I'll tell you what to do. We have to be careful with timing, otherwise the cannon will self destruct!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=400}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=400}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Press the button whenever you're ready. I will tell you when to activate the lever, which is marked by the green particles.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=400}] at @s run clone 984 1 978 992 4 980 ~3 ~4 ~14
execute if entity @s[scores={tutorial=400}] at @s run kill @e[type=minecraft:tnt,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=401..403}] at @s if block ~3 ~5 ~15 minecraft:stone_button[powered=true] run scoreboard players set @s tutorial 404
execute if entity @s[scores={tutorial=403}] at @s run scoreboard players set @s tutorial 402

execute if entity @s[scores={tutorial=404..599}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:d78caebfec1fcae7f99868e50922e7e9a1c739c84a8c52ed6155cad8c715493f
execute if entity @s[scores={tutorial=404}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=404}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Get ready to flip the lever..\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=402..439}] at @s run particle minecraft:happy_villager ~10 ~6 ~14 0 0 0 0 1 normal

execute if entity @s[scores={tutorial=420}] at @s run setblock ~3 ~5 ~15 minecraft:air
execute if entity @s[scores={tutorial=440}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=440}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Flip the lever!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=440}] at @s run setblock ~10 ~6 ~14 minecraft:lever[face=wall,facing=west]
execute if entity @s[scores={tutorial=400..600}] at @s as @e[type=minecraft:tnt,dx=20,dy=100,dz=30,nbt={fuse:1s}] at @s unless block ~ ~ ~ minecraft:water run function main:server/util/explode_entity
execute if entity @s[scores={tutorial=480}] at @s run setblock ~10 ~6 ~14 minecraft:air

execute if entity @s[scores={tutorial=600..}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3
execute if entity @s[scores={tutorial=600}] at @s if block ~29 ~3 ~15 minecraft:air run scoreboard players set @s tutorial 700
execute if entity @s[scores={tutorial=600}] at @s unless block ~29 ~3 ~15 minecraft:air run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=600}] at @s unless block ~29 ~3 ~15 minecraft:air run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Hmm. Let's try that again. Remember to flip the lever!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=700}] at @s unless block ~29 ~3 ~15 minecraft:air run scoreboard players set @s tutorial 399

execute if entity @s[scores={tutorial=700}] at @s run setblock ~10 ~6 ~14 minecraft:air
execute if entity @s[scores={tutorial=700}] at @s run setblock ~3 ~5 ~15 minecraft:air
execute if entity @s[scores={tutorial=700}] at @s run kill @e[type=minecraft:tnt,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=700}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=700}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Great! Isn't that fun?\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=800}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=800}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Let's see if you can make this cannon.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=900}] at @s run fill ~3 ~3 ~12 ~11 ~3 ~14 minecraft:lime_concrete
execute if entity @s[scores={tutorial=900}] at @s run clone 984 1 962 992 4 964 ~3 ~4 ~16

execute if entity @s[scores={tutorial=900}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=900}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Copy the other cannon exactly! Use the pickaxe if you need to break anything. Right click the wrench to reset!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=901}] at @s run tag @s remove place_water
execute if entity @s[scores={tutorial=901}] at @s run fill ~1 ~4 ~1 ~14 ~28 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=901}] at @s run clear @a[dx=30,dy=100,dz=30,team=tutorial]
execute if entity @s[scores={tutorial=901}] at @s run scoreboard players reset @a[dx=30,dy=100,dz=30,team=tutorial] wrench
execute if entity @s[scores={tutorial=901}] at @s run loot give @a[dx=30,dy=100,dz=30,team=tutorial] mine 994 1 1000 minecraft:diamond_pickaxe[minecraft:custom_data={drop_contents:1b}]
execute if entity @s[scores={tutorial=901}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=901..903}] at @s unless blocks 984 1 962 992 4 964 ~3 ~4 ~16 masked run tag @a[dx=30,dy=100,dz=30,team=tutorial] remove break_active
execute if entity @s[scores={tutorial=901..903}] at @s unless blocks 984 1 962 992 4 964 ~3 ~4 ~16 masked run clone 984 1 962 992 4 964 ~3 ~4 ~16
execute if entity @s[scores={tutorial=901..903}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] run function main:server/tutorial/break_block
execute if entity @s[scores={tutorial=901..903}] at @s if block ~4 ~4 ~13 minecraft:water run tag @s add place_water
execute if entity @s[tag=place_water,scores={tutorial=901..903}] at @s run clone ~4 ~4 ~17 ~10 ~4 ~17 ~4 ~4 ~13
execute if entity @s[scores={tutorial=901..903}] at @s if block ~3 ~5 ~13 minecraft:stone_button run clone ~3 ~5 ~17 ~3 ~5 ~17 ~3 ~5 ~13
execute if entity @s[scores={tutorial=901..903}] at @s run item replace entity @a[dx=30,dy=100,dz=30,team=tutorial] hotbar.8 with minecraft:warped_fungus_on_a_stick[minecraft:custom_name={text:"Wrench ",color:"yellow",extra:[{text:"(Right Click)",color:"gray",italic:1b}]},minecraft:item_name={extra:["Wrench (Right Click)"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable","minecraft:can_break","minecraft:can_place_on","minecraft:stored_enchantments"]}] 1
execute if entity @s[scores={tutorial=901..903}] at @s if entity @a[dx=30,dy=100,dz=30,scores={wrench=1..},team=tutorial] run scoreboard players set @s tutorial 900
execute if entity @s[scores={tutorial=901..903}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s unless block ~ ~ ~ minecraft:air run tellraw @a[distance=..6] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Hey! Focus on making the cannon!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=901..903}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s unless block ~ ~ ~ minecraft:air run tp @s ~ ~1 ~
execute if entity @s[scores={tutorial=901..903}] at @s run title @a[dx=30,dy=100,dz=30,team=tutorial] actionbar [{text:"Right click the wrench to reset the build if you make a mistake.",color:"yellow",type:"text"}]
execute if entity @s[scores={tutorial=902..903}] at @s if blocks ~3 ~4 ~16 ~11 ~7 ~18 ~3 ~4 ~12 masked run scoreboard players set @s tutorial 904
execute if entity @s[scores={tutorial=903}] at @s run scoreboard players set @s tutorial 902

execute if entity @s[scores={tutorial=904}] at @s run tag @a[dx=30,dy=100,dz=30,team=tutorial] remove break_active
execute if entity @s[scores={tutorial=904}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=904}] at @s run clear @a[dx=30,dy=100,dz=30,team=tutorial]
execute if entity @s[scores={tutorial=904}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=904}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Great job! This is an easy cannon that will always serve you well.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=904}] at @s run particle minecraft:end_rod ~7 ~5 ~15 2 1 3 0.01 100

execute if entity @s[scores={tutorial=1000}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=1000}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1000}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1000}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=1000}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1000}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"There's many different cannons you can make. Let's look at another one!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=1100}] at @s run clone 984 1 966 992 4 970 ~3 ~4 ~12
execute if entity @s[scores={tutorial=1100}] at @s run summon block_display ~8.5 ~4.5 ~12.5 {Tags:["tutorial_display"],Glowing:1b,block_state:{Name:"minecraft:comparator",Properties:{facing:"south",mode:"subtract",powered:"false"}}}
execute if entity @s[scores={tutorial=1100}] at @s run summon minecraft:text_display ~9 ~6.3 ~13 {Tags:["tutorial_display"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"Right here is a comparator",color:"yellow"}}
execute if entity @s[scores={tutorial=1100}] at @s run summon minecraft:text_display ~9 ~6 ~13 {Tags:["tutorial_display"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"in subtract mode. It creates",color:"yellow"}}
execute if entity @s[scores={tutorial=1100}] at @s run summon minecraft:text_display ~9 ~5.7 ~13 {Tags:["tutorial_display"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"a clock when powered that",color:"yellow"}}
execute if entity @s[scores={tutorial=1100}] at @s run summon minecraft:text_display ~9 ~5.4 ~13 {Tags:["tutorial_display"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"causes the cannon to become",color:"yellow"}}
execute if entity @s[scores={tutorial=1100}] at @s run summon minecraft:text_display ~9 ~5.1 ~13 {Tags:["tutorial_display"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"semi-automatic! Cool, right?",color:"yellow"}}
execute if entity @s[scores={tutorial=1100}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1100}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"This one uses comparators to automatically shoot the tnt. Take a look at the design for a second and then try it out!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1101..1103}] at @s if block ~3 ~5 ~15 minecraft:stone_button[powered=true] run scoreboard players set @s tutorial 1104
execute if entity @s[scores={tutorial=1103}] at @s run scoreboard players set @s tutorial 1102

execute if entity @s[scores={tutorial=1104}] at @s run kill @e[type=minecraft:text_display,dx=30,dy=100,dz=30,tag=tutorial_display]
execute if entity @s[scores={tutorial=1104}] at @s run kill @e[type=minecraft:block_display,dx=30,dy=100,dz=30,tag=tutorial_display]
execute if entity @s[scores={tutorial=1104}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1104}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Look at how this one automatically shoots plenty of tnt!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=1124}] at @s run setblock ~3 ~5 ~15 minecraft:air

execute if entity @s[scores={tutorial=1200}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1200}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"This cannon is just a bit different from the last one, so you should be able to make it. You can also learn from videos online!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=1400}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1400}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"That should be it for now! As always, you can come back at any time. Good luck!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1400}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}

execute if entity @s[scores={tutorial=1500..}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] at @s run function main:server/rejoin_player

return 1