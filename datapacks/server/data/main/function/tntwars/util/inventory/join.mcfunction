tp @s ~2 ~ ~
tag @s add editing
function main:tntwars/util/get_items
playsound minecraft:entity.experience_orb.pickup master @s ~ ~100 ~ 255 2
tellraw @s [{text:"\nPlace the items you want in your hotbar into the enderchest.\n",color:"light_purple",type:"text"}]

return 1