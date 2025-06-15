scoreboard players add *team_grief settings 1
execute if score *team_grief settings matches 2.. run scoreboard players set *team_grief settings 0
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1


#off
execute if score *team_grief settings matches 0 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]{front_text:{messages:['',{text:"TEAM GRIEF",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/team_grief"},type:"text"},{text:"OFF",color:"gray",italic:1b,type:"text"},'']}} destroy

#on
execute if score *team_grief settings matches 1 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{front_text:{messages:['',{text:"TEAM GRIEF",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/team_grief"},type:"text"},{text:"ON",color:"gray",italic:1b,type:"text"},'']}} destroy
return 1