kill @e[tag=gmh]
execute as @e[tag=gamemode_hologram] at @s run particle minecraft:firework ~ ~ ~ 0 0 0 .1 10

execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~.6 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"DEATHMATCH",color:"blue",bold:1b}}

execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~.3 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"Everyone has one life, so",color:"aqua",bold:0b}}
execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~ ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"make it count! Island crossing",color:"aqua",bold:0b}}
execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.3 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"isn't allowed. Be the last team",color:"aqua",bold:0b}}
execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.6 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"standing to win!",color:"aqua",bold:0b}}
#execute as @e[type=text_display,tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.9 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"Last team standing wins!",color:"aqua",bold:0b}}
#execute as @e[type=text_display,tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-1.2 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"-",color:"aqua",bold:0b}}

return 1