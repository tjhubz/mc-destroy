# /spawn
tellraw @s[scores={click=1}] [{text:"You have been sent to spawn",color:"green",type:"text"}]
execute if entity @s[scores={click=1}] run function main:server/rejoin_player

# /discord
tellraw @s[scores={click=3}] [{text:"Click here!",color:"aqua",click_event:{action:"open_url",url:"https://discord.gg/tNxCx3F"},hover_event:{action:"show_text",value:[{text:"Come on, click it!",type:"text"}]},type:"text"}]
execute if entity @s[scores={click=3}] run playsound minecraft:block.note_block.bit master @s ~ ~100 ~ 1000 2

# tntwars
execute if block 0 9 24 minecraft:iron_bars if entity @s[scores={click=200}] at @s run scoreboard players reset @s click
execute if entity @s[tag=!tntwars,scores={click=200}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~100 ~ 255 1
execute if entity @s[tag=tntwars,scores={click=200}] at @s run scoreboard players reset @s click
execute if entity @s[tag=!tntwars,scores={click=200}] at @s if score tntwars_timer global matches 30.. run tellraw @s ["",{text:"\nERROR",bold:1b,color:"dark_red",type:"text"},{text:" There is a game in progress! Click an option below:",color:"red",type:"text"},{text:"\n",type:"text"},{text:"\n - ",color:"gray",type:"text"},{text:"SPECTATE",bold:1b,color:"light_purple",click_event:{action:"run_command",command:"/trigger click set 201"},type:"text"},{text:"\n - ",color:"gray",type:"text"},{text:"JOIN\n",bold:1b,color:"light_purple",click_event:{action:"run_command",command:"/trigger click set 202"},type:"text"}]
execute if entity @s[scores={click=200}] at @s if score tntwars_timer global matches 30.. run scoreboard players reset @s click

execute if entity @s[tag=queue,scores={click=200}] at @s run tag @s add leavequeue
execute if entity @s[tag=!queue,scores={click=200}] at @s run tellraw @s [{text:"SUCCESS! ",bold:1b,color:"dark_green",type:"text"},{text:"You've joined the queue!",color:"green",bold:0b,type:"text"}]
execute if entity @s[tag=!queue,scores={click=200}] at @s run tag @s add queue

execute if entity @s[tag=leavequeue,scores={click=200}] at @s run tellraw @s [{text:"ALERT ",bold:1b,color:"gold",type:"text"},{text:"You left the queue.",color:"yellow",bold:0b,type:"text"}]
execute if entity @s[tag=leavequeue,scores={click=200}] at @s run tag @s remove queue
execute if entity @s[tag=leavequeue,scores={click=200}] at @s run tag @s remove leavequeue
execute if entity @s[scores={click=200}] at @s run scoreboard players reset @s click


execute if entity @s[tag=!tntwars,tag=!soulshot,scores={click=201},team=!tutorial] at @s run gamemode spectator @s
execute if entity @s[tag=!tntwars,tag=!soulshot,scores={click=201},team=!tutorial] at @s run tellraw @s [{text:"SUCCESS ",bold:1b,color:"dark_green",type:"text"},{text:"Spectator mode activated. Do /trigger click set 1 to get back to the spawn!",color:"green",bold:0b,type:"text"}]
execute if entity @s[scores={click=201},team=!tutorial] at @s run scoreboard players reset @s click

execute if entity @s[scores={click=202},team=main] at @s if score tntwars_timer global matches ..29 run tellraw @s [{text:"ERROR ",bold:1b,color:"dark_red",type:"text"},{text:"There isn't an ongoing game. Do /queue!",color:"red",bold:0b,type:"text"}]
execute if entity @s[scores={click=202},team=main] at @s if score tntwars_timer global matches ..29 run scoreboard players reset @s click
execute if entity @s[scores={click=202},team=main] at @s if score tntwars_teams global matches 2 run tellraw @s [{text:"SUCCESS ",bold:1b,color:"dark_green",type:"text"},{text:"There you go!",color:"green",bold:0b,type:"text"}]
execute if entity @s[scores={click=202},team=main] at @s if score tntwars_teams global matches 2 run function main:tntwars/teams/join
execute if entity @s[scores={click=202},team=main] at @s if score tntwars_teams global matches 4 if score tntwars_active global matches ..3 run tellraw @s [{text:"ERROR ",bold:1b,color:"dark_red",type:"text"},{text:"This gamemode cannot be joined once a team has been eliminated. Sorry!",color:"red",bold:0b,type:"text"}]
execute if entity @s[scores={click=202},team=main] at @s if score tntwars_teams global matches 4 if score tntwars_active global matches ..3 run scoreboard players reset @s click
execute if entity @s[scores={click=202},team=main] at @s if score tntwars_teams global matches 4 if score tntwars_active global matches 4 run tellraw @s [{text:"SUCCESS ",bold:1b,color:"dark_green",type:"text"},{text:"There you go! Thanks for being a donator.",color:"green",bold:0b,type:"text"}]
execute if entity @s[scores={click=202},team=main] at @s if score tntwars_teams global matches 4 if score tntwars_active global matches 4 run function main:tntwars/teams/join

execute if entity @s[scores={click=202}] at @s run scoreboard players reset @s click


#game settings shop
execute if entity @s[scores={click=204..220}] at @s run playsound minecraft:ui.button.click master @s ~ ~100 ~ 255 1
execute if entity @s[scores={click=204..220}] if score *allow_changes settings matches 0 run tellraw @s [{text:"ERROR ",bold:1b,color:"dark_red",type:"text"},{text:"Editing game settings is currently disabled.",color:"red",bold:0b,type:"text"}]
execute if entity @s[scores={click=204..220}] if score *allow_changes settings matches 0 run scoreboard players reset @s click
execute if entity @s[scores={click=204..220}] if score tntwars_timer global matches 29.. run tellraw @s [{text:"ERROR ",bold:1b,color:"dark_red",type:"text"},{text:"A game is currently running!",color:"red",bold:0b,type:"text"}]
execute if entity @s[scores={click=204..220}] if score tntwars_timer global matches 29.. run scoreboard players reset @s click
execute if entity @s[scores={click=204..209}] if score *change_mode settings matches 1 run tellraw @s [{text:"ERROR ",bold:1b,color:"dark_red",type:"text"},{text:"The gamemode has already been changed for the next game.",color:"red",bold:0b,type:"text"}]
execute if entity @s[scores={click=204..209}] if score *change_mode settings matches 1 run scoreboard players reset @s click
execute if entity @s[scores={click=210..220}] if score *change_map settings matches 1 run tellraw @s [{text:"ERROR ",bold:1b,color:"dark_red",type:"text"},{text:"The map has already been changed for the next game.",color:"red",bold:0b,type:"text"}]
execute if entity @s[scores={click=210..220}] if score *change_map settings matches 1 run scoreboard players reset @s click
execute if entity @s[scores={click=204..209,souls=..49}] run tellraw @s [{text:"ERROR ",bold:1b,color:"dark_red",type:"text"},{text:"You don't have enough souls to do that.",color:"red",bold:0b,type:"text"}]
execute if entity @s[scores={click=204..209,souls=..49}] run scoreboard players reset @s click
execute if entity @s[scores={click=220..220,souls=..24}] run tellraw @s [{text:"ERROR ",bold:1b,color:"dark_red",type:"text"},{text:"You don't have enough souls to do that.",color:"red",bold:0b,type:"text"}]
execute if entity @s[scores={click=210..220,souls=..24}] run scoreboard players reset @s click

execute if entity @s[scores={click=204}] unless score *map settings matches 1 run tellraw @s [{text:"ERROR ",bold:1b,color:"dark_red",type:"text"},{text:"Classic mode can only be set for 2 team maps.",color:"red",bold:0b,type:"text"}]
execute if entity @s[scores={click=204}] unless score *map settings matches 1 run scoreboard players reset @s click
execute if entity @s[scores={click=211..220}] if score *preset settings matches 1 run tellraw @s [{text:"ERROR ",bold:1b,color:"dark_red",type:"text"},{text:"4 team maps cannot be set in classic mode.",color:"red",bold:0b,type:"text"}]
execute if entity @s[scores={click=211..220}] if score *preset settings matches 1 run scoreboard players reset @s click

execute if entity @s[scores={click=204..209}] at @s run scoreboard players set *change_mode settings 1
execute if entity @s[scores={click=210..220}] at @s run scoreboard players set *change_map settings 1
execute if entity @s[scores={click=204..209}] run scoreboard players remove @s souls 50
execute if entity @s[scores={click=210..220}] run scoreboard players remove @s souls 25

execute if entity @s[scores={click=204..209}] run tellraw @s [{text:"SUCCESS ",bold:1b,color:"dark_green",type:"text"},{text:"Gamemode set!",color:"green",bold:0b,type:"text"}]
execute if entity @s[scores={click=204}] run function main:tntwars/settings/preset/classic
execute if entity @s[scores={click=205}] run function main:tntwars/settings/preset/anarchy
execute if entity @s[scores={click=206}] run function main:tntwars/settings/preset/slimewars

execute if entity @s[scores={click=210..220}] run tellraw @s [{text:"SUCCESS ",bold:1b,color:"dark_green",type:"text"},{text:"Map set!",color:"green",bold:0b,type:"text"}]
execute if entity @s[scores={click=210}] run function main:tntwars/settings/map/map1
execute if entity @s[scores={click=211}] run function main:tntwars/settings/map/map3
execute if entity @s[scores={click=212}] run function main:tntwars/settings/map/map4
execute if entity @s[scores={click=213}] run function main:tntwars/settings/map/map5
execute if entity @s[scores={click=210..220}] run function main:tntwars/map/reset

scoreboard players reset @s click

return 1