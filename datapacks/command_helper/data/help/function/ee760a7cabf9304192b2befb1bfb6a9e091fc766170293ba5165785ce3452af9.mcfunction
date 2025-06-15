effect give @a[dx=30,dy=100,dz=30,team=tutorial] minecraft:levitation 1 255 true
execute as @a[dx=30,dy=100,dz=30,team=tutorial] if entity @s[type=minecraft:player,predicate=effect:levitation] run function effect:levitation/check
return 1