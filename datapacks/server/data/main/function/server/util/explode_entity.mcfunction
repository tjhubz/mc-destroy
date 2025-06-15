summon minecraft:creeper ~ ~100 ~ {Invulnerable:1b,ExplosionRadius:2b,Fuse:0s,ignited:1b,Tags:["fake_explosion"],Silent:1b}
teleport @e[type=minecraft:creeper,dy=100,tag=fake_explosion,sort=nearest,limit=1] ~ ~ ~
execute if entity @s[type=minecraft:trident] run playsound minecraft:item.trident.return master @a ~ ~ ~ 10 1
kill @s
#say explode_entity

return 1