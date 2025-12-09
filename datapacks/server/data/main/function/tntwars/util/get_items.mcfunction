execute at @s run clear @s
loot replace entity @s inventory.0 mine -17 8 24 minecraft:diamond_pickaxe[minecraft:custom_data={drop_contents:1b}]
tag @s add hasBucket

#apply pvp style attack speed to player
function main:tntwars/settings/pvp_style/apply

#grab hotbar
execute if entity @s[tag=!editing] at @s run data modify storage hotbar enderchest set from entity @s EnderItems
execute if entity @s[tag=!editing] at @s run data modify block -17 6 24 Items set from storage hotbar enderchest
execute if entity @s[tag=!editing] at @s run loot replace entity @s hotbar.0 9 mine -17 6 24 minecraft:diamond_pickaxe[minecraft:custom_data={drop_contents:1b}]
clear @s minecraft:barrier

execute at @s run item replace entity @s hotbar.8 with minecraft:carrot_on_a_stick[minecraft:custom_name={text:"Inventory reset!",color:"dark_purple",italic:0b,extra:[{text:" (Right Click)",color:"gray",italic:1b}]},minecraft:item_name={extra:["Inventory reset! (Right Click)"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:unbreakable"]}] 1

#armor - all presets get team leather helmet for identification
execute if entity @s[tag=!editing,team=red] at @s run item replace entity @s armor.head with minecraft:leather_helmet[minecraft:dyed_color=16711680,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=blue] at @s run item replace entity @s armor.head with minecraft:leather_helmet[minecraft:dyed_color=255,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=yellow] at @s run item replace entity @s armor.head with minecraft:leather_helmet[minecraft:dyed_color=16774912,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if entity @s[tag=!editing,team=white] at @s run item replace entity @s armor.head with minecraft:leather_helmet[minecraft:dyed_color=16777215,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1

#armor preset 0 (Standard) - team leather chest/legs + iron boots BP5
execute if score *armor_preset settings matches 0 if entity @s[tag=!editing,team=red] at @s run item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=16711680,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if score *armor_preset settings matches 0 if entity @s[tag=!editing,team=red] at @s run item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:dyed_color=16711680,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if score *armor_preset settings matches 0 if entity @s[tag=!editing,team=blue] at @s run item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=255,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if score *armor_preset settings matches 0 if entity @s[tag=!editing,team=blue] at @s run item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:dyed_color=255,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if score *armor_preset settings matches 0 if entity @s[tag=!editing,team=yellow] at @s run item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=16774912,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if score *armor_preset settings matches 0 if entity @s[tag=!editing,team=yellow] at @s run item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:dyed_color=16774912,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if score *armor_preset settings matches 0 if entity @s[tag=!editing,team=white] at @s run item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=16777215,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if score *armor_preset settings matches 0 if entity @s[tag=!editing,team=white] at @s run item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:dyed_color=16777215,minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}] 1
execute if score *armor_preset settings matches 0 if entity @s[tag=!editing] at @s run item replace entity @s armor.feet with minecraft:iron_boots[minecraft:enchantments={"minecraft:blast_protection":5,"minecraft:binding_curse":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:attribute_modifiers"]}] 1

#armor preset 1 (Fortress) - netherite chest/legs/boots with BP4, survives TNT
execute if score *armor_preset settings matches 1 if entity @s[tag=!editing] at @s run item replace entity @s armor.chest with minecraft:netherite_chestplate[minecraft:enchantments={"minecraft:blast_protection":4,"minecraft:binding_curse":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:attribute_modifiers"]}] 1
execute if score *armor_preset settings matches 1 if entity @s[tag=!editing] at @s run item replace entity @s armor.legs with minecraft:netherite_leggings[minecraft:enchantments={"minecraft:blast_protection":4,"minecraft:binding_curse":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:attribute_modifiers"]}] 1
execute if score *armor_preset settings matches 1 if entity @s[tag=!editing] at @s run item replace entity @s armor.feet with minecraft:netherite_boots[minecraft:enchantments={"minecraft:blast_protection":4,"minecraft:binding_curse":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:attribute_modifiers"]}] 1

#armor preset 2 (Fragile) - only team helmet, no other armor, everything lethal

#epic hats
execute if entity @s[tag=!editing,scores={cool=1..}] at @s run item replace entity @s armor.head with minecraft:obsidian[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=FluffehPenguin] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=Teejers] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=MatrixTunnel] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=Srejeet] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=RedDemptr] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=ThatOneSponk] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]
execute if entity @s[tag=!editing,name=Dextur] at @s run item replace entity @s armor.head with minecraft:command_block[minecraft:enchantments={"minecraft:binding_curse":1},minecraft:unbreakable={}]

#sword - weapon preset determines the sword (pvp style handled by player attribute)
#Standard weapon - iron sword
execute if score *weapon_preset settings matches 0 at @s run item replace entity @s[tag=!editing] hotbar.0 with minecraft:iron_sword[minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:attribute_modifiers","minecraft:unbreakable"]}] 1
#Deadly weapon - netherite sword + sharpness
execute if score *weapon_preset settings matches 1 at @s run item replace entity @s[tag=!editing] hotbar.0 with minecraft:netherite_sword[minecraft:enchantments={"minecraft:sharpness":3},minecraft:enchantment_glint_override=1b,minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable"]}] 1
#Displacement weapon - wooden sword + knockback
execute if score *weapon_preset settings matches 2 at @s run item replace entity @s[tag=!editing] hotbar.0 with minecraft:wooden_sword[minecraft:enchantments={"minecraft:knockback":2},minecraft:enchantment_glint_override=1b,minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable"]}] 1
#THE MACE - wind burst + density
execute if score *weapon_preset settings matches 3 at @s run item replace entity @s[tag=!editing] hotbar.0 with minecraft:mace[minecraft:enchantments={"minecraft:wind_burst":3,"minecraft:density":5},minecraft:enchantment_glint_override=1b,minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable"]}] 1

#pickaxe
execute at @s run item replace entity @s[tag=!editing] hotbar.1 with minecraft:iron_pickaxe[minecraft:unbreakable={}] 1

#purchased items
execute if entity @s[tag=hasBucket] at @s run item replace entity @s inventory.10 with minecraft:water_bucket[minecraft:custom_name={text:"Infinite water bucket",color:"blue"},minecraft:item_name={extra:["Infinite water bucket"],text:"EMU"}] 1

return 1