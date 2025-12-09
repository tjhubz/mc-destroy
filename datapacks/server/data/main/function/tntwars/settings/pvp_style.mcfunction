#cycle between 0 (1.9 style - cooldown) and 1 (1.8 style - fast)
execute if entity @s[tag=!set] run scoreboard players add *pvp_style settings 1
execute if score *pvp_style settings matches 2.. run scoreboard players set *pvp_style settings 0
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1

#refresh signs
function main:tntwars/settings/loadout/set

#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check

return 1
