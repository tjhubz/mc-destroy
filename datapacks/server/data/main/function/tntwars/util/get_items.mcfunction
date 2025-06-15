execute at @s run clear @s
loot replace entity @s inventory.0 mine -17 8 24 minecraft:diamond_pickaxe[minecraft:custom_data={drop_contents:1b}]
tag @s add hasBucket

#grab hotbar
execute if entity @s[tag=!editing] at @s run data modify storage hotbar enderchest set from entity @s EnderItems
execute if entity @s[tag=!editing] at @s run data modify block -17 6 24 Items set from storage hotbar enderchest
execute if entity @s[tag=!editing] at @s run loot replace entity @s hotbar.0 9 mine -17 6 24 minecraft:diamond_pickaxe[minecraft:custom_data={drop_contents:1b}]
clear @s minecraft:barrier

execute at @s run item replace entity @s hotbar.8 with minecraft:carrot_on_a_stick[minecraft:custom_name={text:"Inventory reset!",color:"dark_purple",italic:0b,extra:[{text:" (Right Click)",color:"gray",italic:1b}]},minecraft:item_name={extra:["Inventory reset! (Right Click)"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:unbreakable"]}] 1

#armor
execute if entity @s[tag=!editing,team=red] at @s run item replace entity @s armor.head with minecraft:leather_helmet[minecraft:dyed_color=16711680,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=red] at @s run item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=16711680,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=red] at @s run item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:dyed_color=16711680,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1

execute if entity @s[tag=!editing,team=blue] at @s run item replace entity @s armor.head with minecraft:leather_helmet[minecraft:dyed_color=255,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=blue] at @s run item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=255,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=blue] at @s run item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:dyed_color=255,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1

execute if entity @s[tag=!editing,team=yellow] at @s run item replace entity @s armor.head with minecraft:leather_helmet[minecraft:dyed_color=16774912,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=yellow] at @s run item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=16774912,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=yellow] at @s run item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:dyed_color=16774912,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1

execute if entity @s[tag=!editing,team=white] at @s run item replace entity @s armor.head with minecraft:leather_helmet[minecraft:dyed_color=16777215,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=white] at @s run item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=16777215,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=white] at @s run item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:dyed_color=16777215,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1

#epic hats
execute if entity @s[tag=!editing,scores={cool=1..}] at @s run item replace entity @s armor.head with minecraft:obsidian[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=FluffehPenguin] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=Teejers] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=MatrixTunnel] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=Srejeet] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=RedDemptr] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=ThatOneSponk] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=Dextur] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]

execute if entity @s[tag=!editing] at @s run item replace entity @s armor.feet with minecraft:iron_boots[minecraft:enchantments={"minecraft:blast_protection":5,"minecraft:binding_curse":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:attribute_modifiers"]}]

#sword
execute at @s run item replace entity @s[tag=!editing] hotbar.0 with minecraft:diamond_sword[minecraft:attribute_modifiers=[{type:"minecraft:attack_speed",slot:"mainhand",operation:"add_value",id:"minecraft:6584e101-8d63-4231-b4ba-b163b61faf14",amount:25.0d},{type:"minecraft:attack_damage",operation:"add_value",id:"minecraft:a439a929-6574-4719-81ab-6bf2906432b7",amount:6.0d}],minecraft:enchantment_glint_override=1b,minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable"]}] 1

#pickaxe
execute at @s run item replace entity @s[tag=!editing] hotbar.1 with minecraft:iron_pickaxe[minecraft:unbreakable={}] 1

#purchased items
execute if entity @s[tag=hasBucket] at @s run item replace entity @s inventory.10 with minecraft:water_bucket[minecraft:custom_name={text:"Infinite water bucket",color:"blue"},minecraft:item_name={extra:["Infinite water bucket"],text:"EMU"}] 1

return 1