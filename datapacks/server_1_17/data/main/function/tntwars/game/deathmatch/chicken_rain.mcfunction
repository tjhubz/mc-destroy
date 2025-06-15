execute as @r[gamemode=!spectator,tag=tntwars] at @s run summon minecraft:chicken ~ ~25 ~ {Invulnerable:1b,IsChickenJockey:0b,Tags:["explode"]}
execute as @e[type=minecraft:sheep,sort=random,limit=1] at @s run summon minecraft:chicken ~ ~25 ~ {Invulnerable:1b,IsChickenJockey:0b,Tags:["explode"]}

execute if score tntwars_timer global matches 5.. if score tntwars_timer global < *match_limit_s settings run schedule function main:tntwars/game/deathmatch/chicken_rain 5t

return 1