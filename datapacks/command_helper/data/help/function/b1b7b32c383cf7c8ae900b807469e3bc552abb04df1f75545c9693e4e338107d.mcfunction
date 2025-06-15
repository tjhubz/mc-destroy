effect clear @s
execute as @s if entity @s[type=minecraft:player] run function effect:remove_all
return 1