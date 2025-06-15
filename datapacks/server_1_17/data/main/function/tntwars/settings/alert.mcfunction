execute if entity @s[tag=!set] run scoreboard players add *alert settings 1
execute if score *alert settings matches 2.. run scoreboard players set *alert settings 0
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1


#off
execute if score *alert settings matches 0 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"INVADE ALERT",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/alert"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

#on
execute if score *alert settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"INVADE ALERT",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/alert"},type:"text"},{text:"ON",color:"gray",italic:1b,type:"text"},'']}} destroy


#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check
return 1