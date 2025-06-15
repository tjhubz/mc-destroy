clear @a[tag=tntwars] minecraft:crossbow
item replace entity @a[gamemode=!spectator,tag=tntwars] hotbar.0 with minecraft:crossbow[minecraft:charged_projectiles=[{id:"minecraft:spectral_arrow",count:1}],minecraft:unbreakable={}] 1

execute if score tntwars_timer global matches 5.. if score tntwars_timer global < *match_limit_s settings run schedule function main:tntwars/game/deathmatch/rocket_launcher 5t

return 1