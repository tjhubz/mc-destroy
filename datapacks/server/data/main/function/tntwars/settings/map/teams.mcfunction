scoreboard players add *teams settings 2
execute if score *teams settings matches 6.. run scoreboard players set *teams settings 2
playsound minecraft:ui.button.click master @s ~ ~100 ~ 10000 1


#two
execute if score *teams settings matches 2 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=west]{front_text:{messages:['',{text:"TEAMS",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/teams"},type:"text"},{score:{name:"*teams",objective:"settings"},color:"gray",italic:1b,type:"score"},'']}} destroy


#four
execute if score *teams settings matches 4 run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=west]{front_text:{messages:['',{text:"TEAMS",color:"gold",bold:1b,click_event:{action:"run_command",command:"/function main:tntwars/settings/map/teams"},type:"text"},{score:{name:"*teams",objective:"settings"},color:"gray",italic:1b,type:"score"},'']}} destroy


#set
fill ~ ~-1 ~2 ~ ~1 ~3 minecraft:air
execute if score *cycle settings matches 0 run function main:tntwars/settings/map/set
return 1