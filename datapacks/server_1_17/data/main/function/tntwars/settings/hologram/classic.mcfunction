kill @e[tag=gmh]
execute as @e[tag=gamemode_hologram] at @s run particle minecraft:firework ~ ~ ~ 0 0 0 .1 10

execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~.6 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"CLASSIC",color:"dark_purple",bold:1b}}

execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~.3 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"Classic TNT Wars.",color:"light_purple",bold:0b}}
execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~ ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"Island crossing and launching",color:"light_purple",bold:0b}}
execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.3 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"is not allowed. Your team will lose",color:"light_purple",bold:0b}}
execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.6 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"as soon as your sheep dies.",color:"light_purple",bold:0b}}
#execute as @e[type=text_display,tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.9 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"sheep dies.",color:"light_purple",bold:0b}}
#execute as @e[type=text_display,tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-1.2 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"-",color:"light_purple",bold:0b}}

return 1