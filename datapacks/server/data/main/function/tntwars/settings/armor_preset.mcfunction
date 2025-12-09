#cycle through armor presets (0=Standard, 1=Fortress, 2=Fragile)
execute if entity @s[tag=!set] run scoreboard players add *armor_preset settings 1
execute if score *armor_preset settings matches 3.. run scoreboard players set *armor_preset settings 0
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1

#refresh signs
function main:tntwars/settings/loadout/set

#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check

return 1
