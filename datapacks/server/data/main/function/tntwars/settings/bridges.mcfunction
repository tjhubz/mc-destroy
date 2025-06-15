execute if entity @s[tag=!set] run scoreboard players add *bridges settings 1
execute if score *bridges settings matches 2.. run scoreboard players set *bridges settings 0
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1

execute if score *crossing settings matches 0 run tellraw @s[tag=!set,tag=!silent] [{text:"ERROR",color:"dark_red",bold:1b,type:"text"},{text:" Crossing must be on to enable this setting.",color:"red",bold:0b,type:"text"}]
execute if score *crossing settings matches 0 run scoreboard players set *bridges settings 0

#off
execute if score *bridges settings matches 0 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"BRIDGES",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/bridges"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

#on
execute if score *bridges settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"BRIDGES",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/bridges"},type:"text"},{text:"ON",color:"gray",italic:1b,type:"text"},'']}} destroy


#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check

return 1