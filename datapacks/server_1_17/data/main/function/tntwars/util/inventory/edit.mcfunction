item replace entity @s hotbar.8 with minecraft:carrot_on_a_stick[minecraft:custom_name={text:"Inventory reset!",color:"dark_purple",italic:0b,extra:[{text:" (Right Click)",color:"gray",italic:1b}]},minecraft:item_name={extra:["Inventory reset! (Right Click)"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:unbreakable={},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:unbreakable"]}] 1
effect give @s minecraft:weakness 1 255 true
kill @e[type=minecraft:item,distance=..5]

item replace entity @s enderchest.0 with minecraft:wooden_sword[minecraft:custom_name={text:"Reserved for sword",color:"red"},minecraft:item_name={extra:["Reserved for sword"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable","minecraft:can_break","minecraft:can_place_on","minecraft:stored_enchantments"]},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.1 with minecraft:wooden_pickaxe[minecraft:custom_name={text:"Reserved for pickaxe",color:"red"},minecraft:item_name={extra:["Reserved for pickaxe"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable","minecraft:can_break","minecraft:can_place_on","minecraft:stored_enchantments"]},minecraft:custom_data={clear:1}]
#replaceitem entity @s enderchest.2 wooden_shovel{Enchantments:[{id:"minecraft:unbreaking",lvl:1s}],HideFlags:63,display:{Name:"{\"text\":\"Reserved for shovel\",\"color\":\"red\"}"},clear:1}
item replace entity @s enderchest.8 with minecraft:carrot_on_a_stick[minecraft:custom_name={text:"Reserved for inventory reset",color:"red"},minecraft:item_name={extra:["Reserved for inventory reset"],text:"EMU"},minecraft:enchantments={"minecraft:unbreaking":1},minecraft:tooltip_display={hidden_components:["minecraft:enchantments","minecraft:attribute_modifiers","minecraft:unbreakable","minecraft:can_break","minecraft:can_place_on","minecraft:stored_enchantments"]},minecraft:custom_data={clear:1}]

item replace entity @s enderchest.9 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.10 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.11 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.12 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.13 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.14 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.15 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.16 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.17 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.18 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.19 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.20 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.21 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.22 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.23 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.24 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.25 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
item replace entity @s enderchest.26 with minecraft:barrier[minecraft:custom_name="",minecraft:item_name={extra:[""],text:"EMU"},minecraft:custom_data={clear:1}]
clear @s #minecraft:all[minecraft:custom_data~{clear:1}]

return 1