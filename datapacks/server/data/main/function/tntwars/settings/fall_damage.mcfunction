execute if entity @s[tag=!set] run scoreboard players add *fall_damage settings 1
execute if score *fall_damage settings matches 2.. run scoreboard players set *fall_damage settings 0
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1


#off
execute if score *fall_damage settings matches 0 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"FALL DAMAGE",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/fall_damage"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy
execute if score *fall_damage settings matches 0 run gamerule fallDamage false

#on
execute if score *fall_damage settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"FALL DAMAGE",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/fall_damage"},type:"text"},{text:"ON",color:"gray",italic:1b,type:"text"},'']}} destroy
execute if score *fall_damage settings matches 1 run gamerule fallDamage true


#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check

return 1