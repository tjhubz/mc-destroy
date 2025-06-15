#tracking
execute if score tntwars_queue global matches 0.. as @a store result score tntwars_queue global if entity @a[tag=queue]
execute if score tntwars_timer global matches ..4 store result score red_queue global if entity @a[tag=queue,team=red]
execute if score tntwars_timer global matches ..4 store result score blue_queue global if entity @a[tag=queue,team=blue]
execute if score tntwars_timer global matches ..4 store result score yellow_queue global if entity @a[tag=queue,team=yellow]
execute if score tntwars_timer global matches ..4 store result score white_queue global if entity @a[tag=queue,team=white]
execute as @a store result score tntwars_players global if entity @a[tag=tntwars]
execute as @a store result score tntwars_red global if entity @a[tag=alive,team=red]
execute as @a store result score tntwars_blue global if entity @a[tag=alive,team=blue]
execute as @a store result score tntwars_yellow global if entity @a[tag=alive,team=yellow]
execute as @a store result score tntwars_white global if entity @a[tag=alive,team=white]
execute as @a store result score tnt global if entity @e[type=minecraft:tnt]
execute as @a store result score tntwars_teams global if entity @e[type=minecraft:armor_stand,tag=spawn]

#randomize teams button
execute positioned -5 9 33 if block ~ ~ ~ minecraft:stone_button[powered=true] run function main:tntwars/teams/assign
execute positioned 5 9 33 if block ~ ~ ~ minecraft:stone_button[powered=true] run function main:tntwars/teams/assign

#join team
execute if score tntwars_timer global matches ..4 as @a[gamemode=adventure,tag=!tntwars,team=!blue] at @s if block ~ ~-1 ~ minecraft:blue_concrete_powder at @s run function main:tntwars/teams/join/blue
execute if score tntwars_timer global matches ..4 as @a[gamemode=adventure,tag=!tntwars,team=!red] at @s if block ~ ~-1 ~ minecraft:red_concrete_powder at @s run function main:tntwars/teams/join/red
execute if score tntwars_timer global matches ..4 as @a[gamemode=adventure,tag=!tntwars,team=!yellow] at @s if block ~ ~-1 ~ minecraft:yellow_concrete_powder at @s run function main:tntwars/teams/join/yellow
execute if score tntwars_timer global matches ..4 as @a[gamemode=adventure,tag=!tntwars,team=!white] at @s if block ~ ~-1 ~ minecraft:white_concrete_powder at @s run function main:tntwars/teams/join/white
execute if score tntwars_timer global matches ..4 as @a[gamemode=adventure,tag=queue,tag=!tntwars] at @s if block ~ ~-1 ~ minecraft:gray_concrete_powder at @s run function main:tntwars/teams/join/spectate

execute if score tntwars_timer global matches 5.. as @a[gamemode=adventure,team=main] at @s if block ~ ~-1 ~ minecraft:blue_concrete_powder at @s run function main:tntwars/teams/blue
execute if score tntwars_timer global matches 5.. as @a[gamemode=adventure,team=main] at @s if block ~ ~-1 ~ minecraft:red_concrete_powder at @s run function main:tntwars/teams/red
execute if score tntwars_timer global matches 5.. as @a[gamemode=adventure,team=main] at @s if block ~ ~-1 ~ minecraft:yellow_concrete_powder at @s run function main:tntwars/teams/yellow
execute if score tntwars_timer global matches 5.. as @a[gamemode=adventure,team=main] at @s if block ~ ~-1 ~ minecraft:white_concrete_powder at @s run function main:tntwars/teams/white
execute if score tntwars_timer global matches 5.. as @a[gamemode=adventure,team=main] at @s if block ~ ~-1 ~ minecraft:gray_concrete_powder at @s run function main:tntwars/teams/spectate



#start game
execute if score tntwars_timer global matches -1 if block 0 9 35 minecraft:warped_button[powered=true] run function main:tntwars/game/starting
execute if score tntwars_timer global matches 0..4 if block 0 9 35 minecraft:warped_button[powered=true] run function main:tntwars/game/cancel
execute if score tntwars_timer global matches ..4 run function main:tntwars/test_teams
execute if score tntwars_timer global matches 0.. run function main:tntwars/game/active

#timer bossbar
execute if score tntwars_timer global matches 5.. if score tntwars_timer global <= *match_limit_s settings run bossbar set minecraft:game players @a[team=!tutorial]
execute if score tntwars_timer global matches ..4 run bossbar set minecraft:game players

#items
execute as @a[tag=editing,scores={carrotClick=1..}] at @s run function main:tntwars/util/get_items
execute as @r[tag=!editing,scores={carrotClick=1..}] at @s run function main:tntwars/util/get_items
scoreboard players reset @a[scores={carrotClick=1..}] carrotClick
#execute as @e[type=item,nbt={Item:{id:"minecraft:slime_block"}}] at @s run data merge entity @s {PickupDelay:0,Item:{id:"minecraft:honey_block"}}
execute as @a[gamemode=survival,x=-500,y=25,z=-500,distance=..100,team=main] at @s run item replace entity @s hotbar.8 with minecraft:carrot_on_a_stick[minecraft:custom_name={text:"Inventory reset!",color:"dark_purple"},minecraft:item_name={extra:["Inventory reset!"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:unbreakable"]}] 1
execute as @a[gamemode=survival,tag=tntwars] at @s run item replace entity @s hotbar.8 with minecraft:carrot_on_a_stick[minecraft:custom_name={text:"Inventory reset!",color:"dark_purple"},minecraft:item_name={extra:["Inventory reset!"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:unbreakable"]}] 1


#effects
#effect give @a[tag=tntwars] weakness 1000000 255 true
execute if score *crossing settings matches 0 run effect give @a[gamemode=!spectator,tag=tntwars,tag=hasBoots] minecraft:speed 1 2 true


#stop people from breaking things
execute as @a[gamemode=spectator,x=0,y=0,z=100,distance=100..110,tag=!settings,team=main] at @s run function main:server/rejoin_player
execute as @a[gamemode=spectator,x=0,y=0,z=0,distance=..30,tag=!settings,team=main] at @s run function main:server/rejoin_player
execute as @a[gamemode=adventure,x=-41,y=0,z=75,dx=82,dy=30,dz=50,team=main] at @s run function main:server/rejoin_player
execute as @a[gamemode=survival,x=-41,y=0,z=75,dx=82,dy=30,dz=50,team=main] at @s run function main:server/rejoin_player

#antilag
#execute if score tnt global matches 160.. run kill @e[x=0,y=0,z=100,distance=..300,type=tnt,sort=random,limit=10]
#execute as @a store result score tnt global run execute if entity @e[type=tnt]
#execute if score tnt global matches 250.. run kill @e[type=tnt,sort=random,limit=100]
#execute as @a store result score tnt global run execute if entity @e[type=tnt]
#execute if score tnt global matches 450.. run kill @e[type=tnt,sort=random,limit=200]

#remove items
execute as @e[type=minecraft:item,tag=!noPickup,nbt={Item:{id:"minecraft:tnt"}}] at @s run kill @s
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:carrot_on_a_stick"}}] at @s run kill @s
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:light_gray_concrete_powder"}}] at @s run kill @s
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:red_concrete_powder"}}] at @s run kill @s
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:blue_concrete_powder"}}] at @s run kill @s
execute as @e[type=minecraft:item,tag=!noPickup,nbt={Item:{id:"minecraft:diamond_pickaxe"}}] at @s run kill @s
execute as @e[type=minecraft:item,tag=!noPickup,nbt={Item:{id:"minecraft:diamond_shovel"}}] at @s run kill @s

return 1