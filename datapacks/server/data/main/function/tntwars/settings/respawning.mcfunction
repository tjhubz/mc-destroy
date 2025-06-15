execute if entity @s[tag=!set] run scoreboard players add *respawning settings 1
execute if score *respawning settings matches 2.. run scoreboard players set *respawning settings 0
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1


execute if score *respawning settings matches 1 if score *sheep_health settings matches 1.. run tellraw @s[tag=!set,tag=!silent] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"Because the sheep objective is on, players will be able to respawn until it dies, becoming an elimination match.",color:"yellow",bold:0b,type:"text"}]

execute if score *respawning settings matches 0 if score *sheep_health settings matches 1.. run tellraw @s[tag=!set,tag=!silent] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"Because the sheep objective is on, players will be able to respawn but will lose as soon as their sheep dies.",color:"yellow",bold:0b,type:"text"}]

execute if score *respawning settings matches 1 if score *sheep_health settings matches 0 run tellraw @s[tag=!silent] [{text:"ERROR ",color:"dark_red",bold:1b,type:"text"},{text:"Respawning cannot be turned on if the sheep objective is off. The game must have an objective!",color:"red",bold:0b,type:"text"}]
execute if score *respawning settings matches 1 if score *sheep_health settings matches 0 run scoreboard players set *respawning settings 0


#off
execute if score *respawning settings matches 0 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"RESPAWNING",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/respawning"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

#on
execute if score *respawning settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"RESPAWNING",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/respawning"},type:"text"},{text:"ON",color:"gray",italic:1b,type:"text"},'']}} destroy


#check if preset
execute if entity @s[tag=!set] run function main:tntwars/settings/preset/check
return 1