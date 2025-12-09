#pvp style sign at ~1 ~ ~ from settings_loadout marker
execute if score *pvp_style settings matches 0 at @e[tag=settings_loadout] run setblock ~1 ~ ~ minecraft:crimson_wall_sign[facing=south]{front_text:{messages:['',{text:"PVP STYLE",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/pvp_style"},type:"text"},{text:"1.9 (Cooldown)",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *pvp_style settings matches 1 at @e[tag=settings_loadout] run setblock ~1 ~ ~ minecraft:crimson_wall_sign[facing=south]{front_text:{messages:['',{text:"PVP STYLE",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/pvp_style"},type:"text"},{text:"1.8 (Fast)",color:"gray",italic:1b,type:"text"},'']}} replace

#armor preset sign at ~ ~1 ~1 from settings_loadout marker
execute if score *armor_preset settings matches 0 at @e[tag=settings_loadout] run setblock ~ ~1 ~1 minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"ARMOR",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/armor_preset"},type:"text"},{text:"Standard",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *armor_preset settings matches 1 at @e[tag=settings_loadout] run setblock ~ ~1 ~1 minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"ARMOR",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/armor_preset"},type:"text"},{text:"Fortress",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *armor_preset settings matches 2 at @e[tag=settings_loadout] run setblock ~ ~1 ~1 minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"ARMOR",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/armor_preset"},type:"text"},{text:"Fragile",color:"gray",italic:1b,type:"text"},'']}} replace

#weapon preset sign at ~ ~ ~1 from settings_loadout marker
execute if score *weapon_preset settings matches 0 at @e[tag=settings_loadout] run setblock ~ ~ ~1 minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"WEAPON",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/weapon_preset"},type:"text"},{text:"Standard",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *weapon_preset settings matches 1 at @e[tag=settings_loadout] run setblock ~ ~ ~1 minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"WEAPON",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/weapon_preset"},type:"text"},{text:"Deadly",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *weapon_preset settings matches 2 at @e[tag=settings_loadout] run setblock ~ ~ ~1 minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"WEAPON",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/weapon_preset"},type:"text"},{text:"Displacement",color:"gray",italic:1b,type:"text"},'']}} replace
execute if score *weapon_preset settings matches 3 at @e[tag=settings_loadout] run setblock ~ ~ ~1 minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"WEAPON",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/weapon_preset"},type:"text"},{text:"THE MACE",color:"gray",italic:1b,type:"text"},'']}} replace

#armor stand preview - helmet (always white leather for preview)
item replace entity @e[tag=settings_loadout,type=armor_stand] armor.head with minecraft:leather_helmet[minecraft:dyed_color=16777215] 1

#armor stand preview - armor preset 0 (Standard): leather chest/legs + iron boots
execute if score *armor_preset settings matches 0 run item replace entity @e[tag=settings_loadout,type=armor_stand] armor.chest with minecraft:leather_chestplate[minecraft:dyed_color=16777215] 1
execute if score *armor_preset settings matches 0 run item replace entity @e[tag=settings_loadout,type=armor_stand] armor.legs with minecraft:leather_leggings[minecraft:dyed_color=16777215] 1
execute if score *armor_preset settings matches 0 run item replace entity @e[tag=settings_loadout,type=armor_stand] armor.feet with minecraft:iron_boots[minecraft:enchantments={"minecraft:blast_protection":5},minecraft:enchantment_glint_override=1b] 1

#armor stand preview - armor preset 1 (Fortress): netherite chest/legs/boots
execute if score *armor_preset settings matches 1 run item replace entity @e[tag=settings_loadout,type=armor_stand] armor.chest with minecraft:netherite_chestplate[minecraft:enchantments={"minecraft:blast_protection":4},minecraft:enchantment_glint_override=1b] 1
execute if score *armor_preset settings matches 1 run item replace entity @e[tag=settings_loadout,type=armor_stand] armor.legs with minecraft:netherite_leggings[minecraft:enchantments={"minecraft:blast_protection":4},minecraft:enchantment_glint_override=1b] 1
execute if score *armor_preset settings matches 1 run item replace entity @e[tag=settings_loadout,type=armor_stand] armor.feet with minecraft:netherite_boots[minecraft:enchantments={"minecraft:blast_protection":4},minecraft:enchantment_glint_override=1b] 1

#armor stand preview - armor preset 2 (Fragile): no armor (clear slots)
execute if score *armor_preset settings matches 2 run item replace entity @e[tag=settings_loadout,type=armor_stand] armor.chest with minecraft:air
execute if score *armor_preset settings matches 2 run item replace entity @e[tag=settings_loadout,type=armor_stand] armor.legs with minecraft:air
execute if score *armor_preset settings matches 2 run item replace entity @e[tag=settings_loadout,type=armor_stand] armor.feet with minecraft:air

#armor stand preview - weapon preset 0 (Standard): iron sword
execute if score *weapon_preset settings matches 0 run item replace entity @e[tag=settings_loadout,type=armor_stand] weapon.mainhand with minecraft:iron_sword 1

#armor stand preview - weapon preset 1 (Deadly): netherite sword with sharpness
execute if score *weapon_preset settings matches 1 run item replace entity @e[tag=settings_loadout,type=armor_stand] weapon.mainhand with minecraft:netherite_sword[minecraft:enchantments={"minecraft:sharpness":3},minecraft:enchantment_glint_override=1b] 1

#armor stand preview - weapon preset 2 (Displacement): wooden sword with knockback
execute if score *weapon_preset settings matches 2 run item replace entity @e[tag=settings_loadout,type=armor_stand] weapon.mainhand with minecraft:wooden_sword[minecraft:enchantments={"minecraft:knockback":3},minecraft:enchantment_glint_override=1b] 1

#armor stand preview - weapon preset 3 (THE MACE): mace with wind burst and density
execute if score *weapon_preset settings matches 3 run item replace entity @e[tag=settings_loadout,type=armor_stand] weapon.mainhand with minecraft:mace[minecraft:enchantments={"minecraft:wind_burst":3,"minecraft:density":5},minecraft:enchantment_glint_override=1b] 1

return 1
