tp @s ~2 ~ ~
tag @s add editing
function main:tntwars/util/get_items
playsound minecraft:entity.enderman.teleport master @s ~ ~100 ~ 255 1.4
tellraw @s [{text:"\nPlace the items you want in your hotbar into the enderchest.\n",color:"light_purple",type:"text"}]

return 1