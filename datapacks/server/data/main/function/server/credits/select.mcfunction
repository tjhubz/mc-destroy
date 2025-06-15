execute if block ~ ~ ~ minecraft:player_wall_head{profile:{name:"Kingified"}} run function main:server/credits/kingified
execute if block ~ ~ ~ minecraft:player_wall_head{profile:{name:"Kasperio"}} run function main:server/credits/kasperio
execute if block ~ ~ ~ minecraft:player_wall_head{profile:{name:"ThatOneSponk"}} run function main:server/credits/thatonesponk
execute if block ~ ~ ~ minecraft:player_wall_head{profile:{name:"MatrixTunnel"}} run function main:server/credits/matrixtunnel
execute if block ~ ~ ~ minecraft:player_wall_head{profile:{name:"RedDemptr"}} run function main:server/credits/reddemptr

execute if entity @s[distance=..5] unless block ~ ~ ~ minecraft:player_wall_head positioned ^ ^ ^.5 run function main:server/credits/select

return 1