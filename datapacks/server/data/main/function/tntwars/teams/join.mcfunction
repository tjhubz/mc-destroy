#reset
execute if score tntwars_active global matches 4 run scoreboard players set redblue temp 0
execute if score tntwars_active global matches 4 run scoreboard players set yellowwhite temp 0

#step1
execute if score tntwars_active global matches 4 run scoreboard players operation redblue temp += tntwars_blue global
execute if score tntwars_active global matches 4 run scoreboard players operation redblue temp += tntwars_red global
execute if score tntwars_active global matches 4 run scoreboard players operation yellowwhite temp += tntwars_yellow global
execute if score tntwars_active global matches 4 run scoreboard players operation yellowwhite temp += tntwars_white global

#step3
execute if score tntwars_teams global matches 2 if score tntwars_red global >= tntwars_blue global at @s run function main:tntwars/teams/blue
execute if score tntwars_teams global matches 2 if score tntwars_blue global > tntwars_red global at @s run function main:tntwars/teams/red

execute if score tntwars_active global matches 4 if score redblue temp = yellowwhite temp run function main:tntwars/teams/blue
execute if score tntwars_active global matches 4 if score redblue temp < yellowwhite temp if score tntwars_red global >= tntwars_blue global at @s run function main:tntwars/teams/blue
execute if score tntwars_active global matches 4 if score redblue temp < yellowwhite temp if score tntwars_blue global > tntwars_red global at @s run function main:tntwars/teams/red
execute if score tntwars_active global matches 4 if score redblue temp > yellowwhite temp if score tntwars_white global >= tntwars_yellow global at @s run function main:tntwars/teams/yellow
execute if score tntwars_active global matches 4 if score redblue temp > yellowwhite temp if score tntwars_yellow global > tntwars_white global at @s run function main:tntwars/teams/white
return 1