kill @e[tag=gmh]
execute as @e[tag=gamemode_hologram] at @s run particle minecraft:firework ~ ~ ~ 0 0 0 .1 10

execute as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~.6 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"CUSTOM GAME",color:"gold",bold:1b}}

execute if score *sheep_health settings matches 0 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~.3 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"SHEEP",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"OFF",color:"red",bold:0b}]}}
execute if score *sheep_health settings matches 1.. as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~.3 ~ {Tags:["gmh","set_sh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:" "}
execute if score *sheep_health settings matches 1.. run data modify block 0 8 0 front_text.messages[0] set value [{text:"SHEEP HEALTH",color:"yellow",bold:0b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{score:{name:"*sheep_health",objective:"settings"},color:"green",type:"score"}]
execute if score *sheep_health settings matches 1.. as @e[type=minecraft:text_display,tag=set_sh] run data modify entity @s text set from block 0 8 0 front_text.messages[0]

execute if score *launching settings matches 0 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~ ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"LAUNCHING",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"OFF",color:"red",bold:0b}]}}
execute if score *launching settings matches 1 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~ ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"LAUNCHING",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"ON",color:"green",bold:0b}]}}

execute if score *bridges settings matches 0 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.3 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"BRIDGES",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"OFF",color:"red",bold:0b}]}}
execute if score *bridges settings matches 1 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.3 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"BRIDGES",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"ON",color:"green",bold:0b}]}}

execute if score *alert settings matches 0 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.6 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"INVADE ALERT",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"OFF",color:"red",bold:0b}]}}
execute if score *alert settings matches 1 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.6 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"INVADE ALERT",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"ON",color:"green",bold:0b}]}}

execute if score *respawning settings matches 0 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.9 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"RESPAWNING",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"OFF",color:"red",bold:0b}]}}
execute if score *respawning settings matches 1 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-.9 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"RESPAWNING",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"ON",color:"green",bold:0b}]}}

execute if score *fall_damage settings matches 0 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-1.2 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"FALL DAMAGE",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"OFF",color:"red",bold:0b}]}}
execute if score *fall_damage settings matches 1 as @e[tag=gamemode_hologram] at @s run summon minecraft:text_display ~ ~-1.2 ~ {Tags:["gmh"],billboard:"vertical",view_range:0.15f,default_background:1b,alignment:"center",text:{text:"FALL DAMAGE",color:"yellow",bold:0b,extra:[{text:" - ",color:"gray",bold:0b},{text:"ON",color:"green",bold:0b}]}}

return 1