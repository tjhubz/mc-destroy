execute if score *seconds temp matches 0.. run scoreboard players remove *seconds temp 1
execute if score *minutes temp matches 1.. if score *seconds temp matches -1 run scoreboard players remove *minutes temp 1
execute if score *seconds temp matches -1 if score *minutes temp matches 0.. run scoreboard players set *seconds temp 59

scoreboard players operation *time_left temp = *match_limit_s settings
scoreboard players operation *time_left temp -= tntwars_timer global

execute store result bossbar minecraft:game value run scoreboard players get *time_left temp
bossbar set minecraft:game name [{text:"Game will end in: ",color:"green",type:"text"},{score:{name:"*minutes",objective:"temp"},color:"dark_green",type:"score"},{text:"m ",color:"green",type:"text"},{score:{name:"*seconds",objective:"temp"},color:"dark_green",type:"score"},{text:"s",color:"green",type:"text"}]

execute if score *seconds temp matches -1 run scoreboard players set *seconds temp 0

return 1