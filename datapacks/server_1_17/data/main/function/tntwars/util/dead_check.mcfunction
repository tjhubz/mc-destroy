tag @s add dead_check

execute if entity @s[tag=alive,team=blue] unless entity @e[type=minecraft:sheep,tag=blue] run tag @s add died
execute if entity @s[tag=alive,team=red] unless entity @e[type=minecraft:sheep,tag=red] run tag @s add died
execute if entity @s[tag=alive,team=yellow] unless entity @e[type=minecraft:sheep,tag=yellow] run tag @s add died
execute if entity @s[tag=alive,team=white] unless entity @e[type=minecraft:sheep,tag=white] run tag @s add died

execute if entity @s[tag=died] run title @s title [{text:"ELIMINATED",color:"red",type:"text"}]

return 1