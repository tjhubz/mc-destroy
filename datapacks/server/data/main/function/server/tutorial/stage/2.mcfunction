particle minecraft:smoke ~15 ~ ~15 1 1 6 0 10 normal
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=100,dz=30,team=tutorial] at @s run tellraw @s [{"text":"WARNING ","color":"dark_red","bold":"true"},{"text":"The anticheat will kick you if you continue to do that.","color":"red","bold":"false"}]
#execute align xyz positioned ~14.5 ~ ~ as @a[dx=13,dy=100,dz=30,team=tutorial] at @s run tp @s ~-.5 4 ~
execute align xyz positioned ~14.5 ~ ~ run tag @a[dx=13,dy=100,dz=30,team=tutorial] add goback
tp @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] ~3 ~4 ~3
tag @a[dx=30,dy=100,dz=30,tag=goback,team=tutorial] remove goback

execute if entity @s[scores={tutorial=1}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=1}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=1}] at @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run setblock ~ ~ ~ minecraft:air
execute if entity @s[scores={tutorial=1}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] run data merge entity @s {NoBasePlate:1b,ShowArms:1b,Small:1b,CustomName:{text:"TIM",color:"green",bold:1b},CustomNameVisible:0b,DisabledSlots:2039583,Pose:{Head:[356.0f,0.0f,0.0f],LeftLeg:[360.0f,0.0f,354.0f],RightLeg:[0.0f,0.0f,6.0f],LeftArm:[8.0f,0.0f,348.0f],RightArm:[352.0f,0.0f,14.0f]},equipment:{feet:{id:"minecraft:leather_boots",components:{"minecraft:dyed_color":11382189},count:1},legs:{id:"minecraft:leather_leggings",components:{"minecraft:dyed_color":16777215},count:1},chest:{id:"minecraft:leather_chestplate",components:{"minecraft:dyed_color":16777215},count:1},head:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-1822342637,-539147371,-2098275421,-913927303],properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTA4N2Q3NmFlNWQ0OTkxZGQ0NTA2ZmNjY2I4ZjY2NzZlYjIyMzYyMDlhZjZlYjk4MmRjYTMzYzBlOGRlNTkifX19"}]}},count:1}}}
execute if entity @s[scores={tutorial=1..602}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3
execute if entity @s[scores={tutorial=1}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~12
execute if entity @s[scores={tutorial=1}] at @s run fill ~3 ~3 ~14 ~11 ~3 ~16 minecraft:lime_concrete
execute if entity @s[scores={tutorial=1}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Alright! So, in this game you will have to make some TNT cannons. Let me show you a basic one.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=100}] at @s positioned ~3 ~4 ~14 run tag @a[dx=8,dy=100,dz=2] add tp
execute if entity @s[scores={tutorial=100}] at @s as @a[dx=30,dy=100,dz=30,tag=tp] run function help:14857a78d989a4d86cadadc93adc20637c7a9eca8484a866a4a12f5b8757f8a4
execute if entity @s[scores={tutorial=100}] at @s run tag @a[dx=30,dy=100,dz=30,tag=tp] remove tp
execute if entity @s[scores={tutorial=100}] at @s run particle minecraft:explosion ~7 ~5 ~15 2 1 1.5 1 100
execute if entity @s[scores={tutorial=100}] at @s run clone 983 1 995 993 2 999 ~2 ~4 ~13
execute if entity @s[scores={tutorial=100}] at @s run playsound minecraft:entity.generic.extinguish_fire master @s ~ ~100 ~ 255 1
execute if entity @s[scores={tutorial=100}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=100}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"TNT cannons use redstone to run. Try pressing the button to see what the redstone does.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=100..102}] at @s run fill ~8 ~5 ~16 ~10 ~5 ~16 minecraft:repeater[facing=west,delay=4]
execute if entity @s[scores={tutorial=100..102}] at @s if block ~3 ~5 ~15 minecraft:stone_button[powered=true] run scoreboard players set @s tutorial 103
execute if entity @s[scores={tutorial=102}] at @s run scoreboard players set @s tutorial 101

execute if entity @s[scores={tutorial=103}] at @s run summon minecraft:text_display ~9 ~5 ~16 {Tags:["repeater_display"],billboard:"center",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"Repeaters",color:"yellow"}}
execute if entity @s[scores={tutorial=103}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=103}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Great! Watch how the repeaters delay the redstone signal. This will be important later!\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=200}] at @s run kill @e[type=minecraft:text_display,tag=repeater_display,dx=30,dy=100,dz=30]
execute if entity @s[scores={tutorial=200}] at @s run setblock ~3 ~5 ~15 minecraft:air destroy
execute if entity @s[scores={tutorial=200}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=200}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Let's see what the cannon looks like when we load it with tnt.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=250}] at @s run playsound minecraft:block.grass.place master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 .8
execute if entity @s[scores={tutorial=250}] at @s run clone 983 1 991 993 2 995 ~2 ~4 ~13

execute if entity @s[scores={tutorial=300}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=300}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Looking explosive! Let me tell you what the tnt actually does here.\n",color:"yellow",bold:0b,type:"text"}]

execute if entity @s[scores={tutorial=400}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=400}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"These blocks of tnt are what launch the projectile. The water prevents them from blowing up the cannon!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:shulker ~5 ~3.5 ~15 {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,NoAI:1b,active_effects:[{id:"minecraft:invisibility",duration:1000000,show_particles:0b}]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:shulker ~6 ~3.5 ~15 {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,NoAI:1b,active_effects:[{id:"minecraft:invisibility",duration:1000000,show_particles:0b}]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:shulker ~7 ~3.5 ~15 {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,NoAI:1b,active_effects:[{id:"minecraft:invisibility",duration:1000000,show_particles:0b}]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:shulker ~8 ~3.5 ~15 {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,NoAI:1b,active_effects:[{id:"minecraft:invisibility",duration:1000000,show_particles:0b}]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:shulker ~9 ~3.5 ~15 {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,NoAI:1b,active_effects:[{id:"minecraft:invisibility",duration:1000000,show_particles:0b}]}
execute if entity @s[scores={tutorial=400}] at @s run summon minecraft:shulker ~10 ~3.5 ~15 {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,NoAI:1b,active_effects:[{id:"minecraft:invisibility",duration:1000000,show_particles:0b}]}

execute if entity @s[scores={tutorial=500}] at @s as @e[type=minecraft:shulker,dx=30,dy=100,dz=30] run data merge entity @s {Glowing:0b}
execute if entity @s[scores={tutorial=501}] at @s run tp @e[type=minecraft:shulker,dx=30,dy=100,dz=30] ~ ~-1000 ~
execute if entity @s[scores={tutorial=500}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=500}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"This block is the projectile. This will launch when we activate the cannon!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=501}] at @s run summon minecraft:shulker ~11 ~4.5 ~15 {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,NoAI:1b,active_effects:[{id:"minecraft:invisibility",duration:1000000,show_particles:0b}]}

execute if entity @s[scores={tutorial=600}] at @s as @e[type=minecraft:shulker,dx=30,dy=100,dz=30] run data merge entity @s {Glowing:0b}
execute if entity @s[scores={tutorial=601}] at @s run tp @e[type=minecraft:shulker,dx=30,dy=100,dz=30] ~ ~-1000 ~
execute if entity @s[scores={tutorial=600}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=600}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Press the button to fire!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=600}] at @s run setblock ~3 ~5 ~15 minecraft:stone_button[face=floor]
execute if entity @s[scores={tutorial=600..602}] at @s run fill ~8 ~5 ~16 ~10 ~5 ~16 minecraft:repeater[facing=west,delay=4]
execute if entity @s[scores={tutorial=600..602}] at @s if block ~3 ~5 ~15 minecraft:stone_button[powered=true] run scoreboard players set @s tutorial 603
execute if entity @s[scores={tutorial=602}] at @s run scoreboard players set @s tutorial 601
execute if entity @s[scores={tutorial=603}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=603}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Great! Watch the tnt fly!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=603..799}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:d78caebfec1fcae7f99868e50922e7e9a1c739c84a8c52ed6155cad8c715493f

execute if entity @s[scores={tutorial=800..}] as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s run function help:09ad2686e9098a32d463f3d85bd6805b2f7920016311c8f1345af485c0f8bdc3
execute if entity @s[scores={tutorial=800}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=800}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=800}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=800}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=800}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=800}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Oh, I just love explosions, don't you?\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=800}] at @s run fill ~3 ~3 ~14 ~11 ~3 ~16 minecraft:gray_concrete

execute if entity @s[scores={tutorial=900}] at @s run fill ~1 ~4 ~1 ~29 ~30 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=900}] at @s run fill ~1 ~1 ~1 ~13 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=900}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=900}] at @s run fill ~2 ~3 ~2 ~4 ~3 ~4 minecraft:magenta_concrete
execute if entity @s[scores={tutorial=900}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=900}] at @s run fill ~3 ~4 ~12 ~11 ~5 ~18 minecraft:air
execute if entity @s[scores={tutorial=900}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=900}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Now, let's see if you can build a cannon yourself!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=900}] at @s run fill ~3 ~3 ~12 ~11 ~3 ~14 minecraft:lime_concrete
execute if entity @s[scores={tutorial=900}] at @s run clone 983 1 995 993 2 999 ~2 ~4 ~15

execute if entity @s[scores={tutorial=1000}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1000}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Copy the other cannon exactly! Use the pickaxe if you need to break anything. Right click the wrench to reset!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1001}] at @s run tag @s remove place_water
execute if entity @s[scores={tutorial=1001}] at @s run fill ~1 ~4 ~1 ~14 ~28 ~29 minecraft:air replace
execute if entity @s[scores={tutorial=1001}] at @s run clear @a[dx=30,dy=100,dz=30,team=tutorial]
execute if entity @s[scores={tutorial=1001}] at @s run scoreboard players reset @a[dx=30,dy=100,dz=30,team=tutorial] wrench
execute if entity @s[scores={tutorial=1001}] at @s run loot give @a[dx=30,dy=100,dz=30,team=tutorial] mine 996 1 1000 minecraft:diamond_pickaxe[minecraft:custom_data={drop_contents:1b}]
execute if entity @s[scores={tutorial=1001}] at @s run tp @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] ~11 ~3.5 ~9
execute if entity @s[scores={tutorial=1001..1003}] at @s unless blocks 984 1 996 992 2 998 ~3 ~4 ~16 masked run tag @a[dx=30,dy=100,dz=30,team=tutorial] remove break_active
execute if entity @s[scores={tutorial=1001..1003}] at @s unless blocks 984 1 996 992 2 998 ~3 ~4 ~16 masked run clone 983 1 995 993 2 999 ~2 ~4 ~15
execute if entity @s[scores={tutorial=1001..1003}] at @s as @a[dx=30,dy=100,dz=30,team=tutorial] run function main:server/tutorial/break_block
execute if entity @s[scores={tutorial=1001..1003}] at @s if block ~4 ~4 ~13 minecraft:water run tag @s add place_water
execute if entity @s[tag=place_water,scores={tutorial=1001..1003}] at @s run clone ~4 ~4 ~17 ~10 ~4 ~17 ~4 ~4 ~13
execute if entity @s[scores={tutorial=1001..1003}] at @s if block ~8 ~5 ~14 minecraft:repeater[delay=1] run setblock ~8 ~5 ~14 minecraft:repeater[delay=4,facing=west]
execute if entity @s[scores={tutorial=1001..1003}] at @s if block ~9 ~5 ~14 minecraft:repeater[delay=1] run setblock ~9 ~5 ~14 minecraft:repeater[delay=4,facing=west]
execute if entity @s[scores={tutorial=1001..1003}] at @s if block ~10 ~5 ~14 minecraft:repeater[delay=1] run setblock ~10 ~5 ~14 minecraft:repeater[delay=4,facing=west]
execute if entity @s[scores={tutorial=1001..1003}] at @s if block ~3 ~5 ~13 minecraft:stone_button run clone ~3 ~5 ~17 ~3 ~5 ~17 ~3 ~5 ~13
execute if entity @s[scores={tutorial=1001..1003}] at @s run item replace entity @a[dx=30,dy=100,dz=30,team=tutorial] hotbar.8 with minecraft:warped_fungus_on_a_stick[minecraft:custom_name={text:"Wrench ",color:"yellow",extra:[{text:"(Right Click)",color:"gray",italic:1b}]},minecraft:item_name={extra:["Wrench (Right Click)"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable","minecraft:can_break","minecraft:can_place_on","minecraft:stored_enchantments"]}] 1
execute if entity @s[scores={tutorial=1001..1003}] at @s if entity @a[dx=30,dy=100,dz=30,scores={wrench=1..},team=tutorial] run scoreboard players set @s tutorial 1000
execute if entity @s[scores={tutorial=1001..1003}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s unless block ~ ~ ~ minecraft:air run tellraw @a[distance=..6] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Hey! Focus on making the cannon!\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1001..1003}] at @s as @e[type=minecraft:armor_stand,dx=30,dy=100,dz=30,tag=tim] at @s unless block ~ ~ ~ minecraft:air run tp @s ~ ~1 ~
execute if entity @s[scores={tutorial=1001..1003}] at @s run title @a[dx=30,dy=100,dz=30,team=tutorial] actionbar [{text:"Right click the wrench to reset the build if you make a mistake.",color:"yellow",type:"text"}]
execute if entity @s[scores={tutorial=1002..1003}] at @s if blocks ~3 ~4 ~16 ~11 ~5 ~18 ~3 ~4 ~12 masked run scoreboard players set @s tutorial 1004
execute if entity @s[scores={tutorial=1003}] at @s run scoreboard players set @s tutorial 1002

execute if entity @s[scores={tutorial=1004}] at @s run tag @a[dx=30,dy=100,dz=30,team=tutorial] remove break_active
execute if entity @s[scores={tutorial=1004}] at @s run fill ~17 ~1 ~1 ~29 ~3 ~29 minecraft:gray_concrete
execute if entity @s[scores={tutorial=1004}] at @s run clear @a[dx=30,dy=100,dz=30,team=tutorial]
execute if entity @s[scores={tutorial=1004}] at @s run playsound minecraft:block.anvil.land master @a[dx=30,dy=100,dz=30,team=tutorial] ~ ~100 ~ 255 1.5
execute if entity @s[scores={tutorial=1004}] at @s run tellraw @a[dx=30,dy=100,dz=30,team=tutorial] [{text:"\nTIM ",color:"green",bold:1b,type:"text"},{text:"Great job! Now, the main goal of TNT Wars is to kill the other team's sheep using these tnt cannons. Let's try it.\n",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[scores={tutorial=1004}] at @s run particle minecraft:end_rod ~7 ~5 ~15 2 1 3 0.01 100

execute if entity @s[scores={tutorial=1200}] at @s run function main:server/tutorial/next_stage

return 1