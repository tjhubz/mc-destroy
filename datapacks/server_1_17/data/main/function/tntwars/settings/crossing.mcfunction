execute if entity @s[tag=!set] run scoreboard players add *crossing settings 1
execute if score *crossing settings matches 2.. run scoreboard players set *crossing settings 0
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1


#off
execute if score *crossing settings matches 0 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"CROSSING",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/crossing"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy
execute if score *crossing settings matches 0 if score *bridges settings matches 1 positioned ~ ~ ~-1 run function main:tntwars/settings/bridges
execute if score *crossing settings matches 0 if score *launching settings matches 1 positioned ~ ~ ~-2 run function main:tntwars/settings/launching

#on
execute if score *crossing settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"CROSSING",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/crossing"},type:"text"},{text:"ON",color:"gray",italic:1b,type:"text"},'']}} destroy

#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset
return 1