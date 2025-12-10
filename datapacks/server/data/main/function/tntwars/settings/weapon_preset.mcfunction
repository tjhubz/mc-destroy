#cycle through weapon presets (0=Standard, 1=Deadly, 2=Knockback, 3=Mace)
execute if entity @s[tag=!set] run scoreboard players add *weapon_preset settings 1
execute if score *weapon_preset settings matches 4.. run scoreboard players set *weapon_preset settings 0
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1

#refresh signs
function main:tntwars/settings/loadout/set

#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check

return 1
