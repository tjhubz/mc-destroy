playsound minecraft:entity.wither.ambient master @a[tag=tntwars] ~ ~100 ~ 10000 1

execute store result score kill_check temp if entity @e[tag=skeepKill]
execute if score kill_check temp matches 2.. run tag @e[tag=sheepKill] remove sheepKill

#RED
#all players leave/fallback
execute if score tntwars_teams global matches 4 if entity @s[tag=redSpawn,tag=sheep] unless entity @e[type=minecraft:armor_stand,tag=spawn,tag=sheepKill,tag=!redSpawn] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Red",color:"red",bold:0b,type:"text"},{text:" team's sheep was killed!",color:"gray",bold:0b,type:"text"}]
#team killing team
#blue
execute if entity @s[tag=redSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=blueSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Red",color:"red",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"Blue",color:"blue",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]
execute if score *bridges settings matches 1 if score tntwars_teams global matches 2 if entity @s[tag=redSpawn,tag=sheep] run function main:tntwars/map/bridge/purple

#yellow
execute if score tntwars_teams global matches 4 if entity @s[tag=redSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=yellowSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Red",color:"red",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"Yellow",color:"yellow",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]
execute if score *bridges settings matches 1 if score tntwars_teams global matches 4 if entity @s[tag=redSpawn,tag=sheep] run function main:tntwars/map/bridge/orange

#white
execute if score tntwars_teams global matches 4 if entity @s[tag=redSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=whiteSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Red",color:"red",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"White",color:"white",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]
execute if score *bridges settings matches 1 if score tntwars_teams global matches 4 if entity @s[tag=redSpawn,tag=sheep] run function main:tntwars/map/bridge/pink

execute if entity @s[tag=redSpawn,tag=sheep] if score *respawning settings matches 0 run tag @a[team=red] remove alive
execute if entity @s[tag=redSpawn,tag=sheep] if score *respawning settings matches 0 run gamemode spectator @a[team=red]
execute if entity @s[tag=redSpawn,tag=sheep] run kill @e[type=minecraft:sheep,tag=red]
execute if entity @s[tag=redSpawn,tag=sheep] run title @a[team=red] title [{text:"Your sheep has died!",color:"red",bold:0b,type:"text"}]
execute if entity @s[tag=redSpawn,tag=sheep] as @e[tag=join_red] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:red_stained_glass
#######################


#BLUE
execute if entity @s[tag=blueSpawn,tag=sheep] unless entity @e[type=minecraft:armor_stand,tag=spawn,tag=sheepKill,tag=!blueSpawn] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Blue",color:"blue",bold:0b,type:"text"},{text:" team's sheep was killed!",color:"gray",bold:0b,type:"text"}]
#team killing team
#red
execute if entity @s[tag=blueSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=redSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Blue",color:"blue",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"Red",color:"red",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]
execute if score *bridges settings matches 1 if score tntwars_teams global matches 2 if entity @s[tag=blueSpawn,tag=sheep] run function main:tntwars/map/bridge/purple

#yellow
execute if score tntwars_teams global matches 4 if entity @s[tag=blueSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=yellowSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Blue",color:"blue",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"Yellow",color:"yellow",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]
execute if score *bridges settings matches 1 if score tntwars_teams global matches 4 if entity @s[tag=blueSpawn,tag=sheep] run function main:tntwars/map/bridge/lime

#white
execute if score tntwars_teams global matches 4 if entity @s[tag=blueSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=whiteSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Blue",color:"blue",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"White",color:"white",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]
execute if score *bridges settings matches 1 if score tntwars_teams global matches 4 if entity @s[tag=blueSpawn,tag=sheep] run function main:tntwars/map/bridge/light_blue

execute if entity @s[tag=blueSpawn,tag=sheep] if score *respawning settings matches 0 run tag @a[team=blue] remove alive
execute if entity @s[tag=blueSpawn,tag=sheep] if score *respawning settings matches 0 run gamemode spectator @a[team=blue]
execute if entity @s[tag=blueSpawn,tag=sheep] run kill @e[type=minecraft:sheep,tag=blue]
execute if entity @s[tag=blueSpawn,tag=sheep] run title @a[team=blue] title [{text:"Your sheep has died!",color:"red",bold:0b,type:"text"}]
execute if entity @s[tag=blueSpawn,tag=sheep] as @e[tag=join_blue] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:blue_stained_glass
#############


#YELLOW
execute if entity @s[tag=yellowSpawn,tag=sheep] unless entity @e[type=minecraft:armor_stand,tag=spawn,tag=sheepKill,tag=!yellowSpawn] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Yellow",color:"yellow",bold:0b,type:"text"},{text:" team's sheep was killed!",color:"gray",bold:0b,type:"text"}]
#team killing team
#white
execute if score tntwars_teams global matches 4 if entity @s[tag=yellowSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=whiteSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Yellow",color:"yellow",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"White",color:"white",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]

#red
execute if score tntwars_teams global matches 4 if entity @s[tag=yellowSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=redSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Yellow",color:"yellow",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"Red",color:"red",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]
execute if score *bridges settings matches 1 if score tntwars_teams global matches 4 if entity @s[tag=yellowSpawn,tag=sheep] run function main:tntwars/map/bridge/orange

#blue
execute if score tntwars_teams global matches 4 if entity @s[tag=yellowSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=blueSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Yellow",color:"yellow",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"Blue",color:"blue",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]
execute if score *bridges settings matches 1 if score tntwars_teams global matches 4 if entity @s[tag=yellowSpawn,tag=sheep] run function main:tntwars/map/bridge/lime

execute if entity @s[tag=yellowSpawn,tag=sheep] if score *respawning settings matches 0 run tag @a[team=yellow] remove alive
execute if entity @s[tag=yellowSpawn,tag=sheep] if score *respawning settings matches 0 run gamemode spectator @a[team=yellow]
execute if entity @s[tag=yellowSpawn,tag=sheep] run kill @e[type=minecraft:sheep,tag=yellow]
execute if entity @s[tag=yellowSpawn,tag=sheep] as @e[tag=join_yellow] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:yellow_stained_glass
execute if entity @s[tag=yellowSpawn,tag=sheep] run title @a[team=yellow] title [{text:"Your sheep has died!",color:"red",bold:0b,type:"text"}]
##############


#WHITE
execute if entity @s[tag=whiteSpawn,tag=sheep] unless entity @e[type=minecraft:armor_stand,tag=spawn,tag=sheepKill,tag=!whiteSpawn] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"White",color:"white",bold:0b,type:"text"},{text:" team's sheep was killed!",color:"gray",bold:0b,type:"text"}]
#team killing team
#yellow
execute if score tntwars_teams global matches 4 if entity @s[tag=whiteSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=yellowSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"White",color:"white",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"Yellow",color:"yellow",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]

#red
execute if score tntwars_teams global matches 4 if entity @s[tag=whiteSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=redSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"White",color:"white",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"Red",color:"red",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]
execute if score *bridges settings matches 1 if score tntwars_teams global matches 4 if entity @s[tag=whiteSpawn,tag=sheep] run function main:tntwars/map/bridge/pink

#blue
execute if score tntwars_teams global matches 4 if entity @s[tag=whiteSpawn,tag=sheep] if entity @e[type=minecraft:armor_stand,tag=blueSpawn,tag=sheepKill] run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"White",color:"white",bold:0b,type:"text"},{text:" team's sheep was killed by ",color:"gray",bold:0b,type:"text"},{text:"Blue",color:"blue",bold:0b,type:"text"},{text:"!",color:"gray",bold:0b,type:"text"}]
execute if score *bridges settings matches 1 if score tntwars_teams global matches 4 if entity @s[tag=whiteSpawn,tag=sheep] run function main:tntwars/map/bridge/light_blue

execute if entity @s[tag=whiteSpawn,tag=sheep] if score *respawning settings matches 0 run tag @a[team=white] remove alive
execute if entity @s[tag=whiteSpawn,tag=sheep] if score *respawning settings matches 0 run gamemode spectator @a[team=white]
execute if entity @s[tag=whiteSpawn,tag=sheep] run kill @e[type=minecraft:sheep,tag=white]
execute if entity @s[tag=whiteSpawn,tag=sheep] as @e[tag=join_white] at @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:white_stained_glass
execute if entity @s[tag=whiteSpawn,tag=sheep] run title @a[team=white] title [{text:"Your sheep has died!",color:"red",bold:0b,type:"text"}]
###############


scoreboard players reset @a[scores={sheep=1..}] sheep
tag @s[tag=sheep] remove sheep
execute if score *respawning settings matches 0 run tag @s[tag=active] remove active

return 1