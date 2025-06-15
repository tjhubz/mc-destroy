scoreboard players set *teams settings 4
scoreboard players set *map settings 5
playsound minecraft:ui.button.click master @s ~ ~100 ~ 10000 1


#set map
title @s actionbar [{text:"Loading...",color:"red",type:"text"}]
function main:tntwars/map/reset
title @s actionbar [{text:"",color:"red",type:"text"}]

return 1