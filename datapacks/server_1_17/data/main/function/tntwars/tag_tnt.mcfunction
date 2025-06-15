execute if entity @s[type=minecraft:tnt,tag=red] at @s run tag @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white,sort=nearest,limit=1] add red
execute if entity @s[type=minecraft:tnt,tag=blue] at @s run tag @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white,sort=nearest,limit=1] add blue
execute if entity @s[type=minecraft:tnt,tag=yellow] at @s run tag @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white,sort=nearest,limit=1] add yellow
execute if entity @s[type=minecraft:tnt,tag=white] at @s run tag @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white,sort=nearest,limit=1] add white


execute if entity @s[team=red] at @s run tag @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white,sort=nearest,limit=1] add red
execute if entity @s[team=blue] at @s run tag @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white,sort=nearest,limit=1] add blue
execute if entity @s[team=yellow] at @s run tag @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white,sort=nearest,limit=1] add yellow
execute if entity @s[team=white] at @s run tag @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white,sort=nearest,limit=1] add white
return 1