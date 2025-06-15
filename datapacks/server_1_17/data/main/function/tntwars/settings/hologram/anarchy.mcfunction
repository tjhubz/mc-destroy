kill @e[tag=gmh]
execute as @e[tag=gamemode_hologram] at @s run particle minecraft:firework ~ ~ ~ 0 0 0 .1 10

execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~.6 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:[{text:"CHAOS",color:"dark_red",bold:1b}]}

execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~.3 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"Crossing and launching are",color:"red",bold:0b}}
execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~ ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"allowed! Be the last team standing",color:"red",bold:0b}}
execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.3 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"to win. Bridges will form between",color:"red",bold:0b}}
execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.6 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"islands when an adjacent team kills",color:"red",bold:0b}}
execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.9 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"a sheep. Let the chaos begin!",color:"red",bold:0b}}
#execute as @e[type=text_display,tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-1.8 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:'{"text":"-","color":"red","bold":false}'}

return 1