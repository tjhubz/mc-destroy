execute as @e[type=minecraft:armor_stand,tag=spawn] at @s run fill ~-1 ~ ~-1 ~1 ~2 ~1 minecraft:air replace

execute as @a[tag=tntwars,limit=1] run fill -79 33 68 80 33 163 minecraft:air replace

execute as @e[type=minecraft:armor_stand,tag=borderXY] at @s run fill ~ ~ ~ 81 ~32 ~ minecraft:air
execute as @e[type=minecraft:armor_stand,tag=borderXY] at @s run fill ~ ~ ~ ~ ~32 164 minecraft:air
execute as @e[type=minecraft:armor_stand,tag=borderXY] at @s positioned ~ ~-12 ~ run kill @a[gamemode=!spectator,gamemode=!creative,dx=160,dy=-100,dz=160,tag=tntwars]
execute as @e[type=minecraft:armor_stand,tag=borderXY] at @s positioned ~-2 ~ ~-2 run kill @a[gamemode=!spectator,gamemode=!creative,dx=160,dy=100,dz=-100,tag=tntwars]
execute as @e[type=minecraft:armor_stand,tag=borderXY] at @s positioned ~-2 ~ ~-2 run kill @a[gamemode=!spectator,gamemode=!creative,dx=-100,dy=100,dz=160,tag=tntwars]
execute as @e[type=minecraft:armor_stand,tag=borderXY] at @s positioned ~-2 36 ~-2 as @a[gamemode=!spectator,gamemode=!creative,dx=160,dy=100,dz=160,tag=tntwars] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 minecraft:air replace

execute as @e[type=minecraft:armor_stand,tag=bordernXnY] at @s run fill ~ ~ ~ -79 ~32 ~ minecraft:air
execute as @e[type=minecraft:armor_stand,tag=bordernXnY] at @s run fill ~ ~ ~ ~ ~32 67 minecraft:air
execute as @e[type=minecraft:armor_stand,tag=bordernXnY] at @s positioned ~1 ~ ~1 run kill @a[gamemode=!spectator,gamemode=!creative,dx=-160,dy=100,dz=100,tag=tntwars]
execute as @e[type=minecraft:armor_stand,tag=bordernXnY] at @s positioned ~1 ~ ~1 run kill @a[gamemode=!spectator,gamemode=!creative,dx=100,dy=100,dz=-160,tag=tntwars]

execute as @e[type=minecraft:armor_stand,tag=middleX] at @s run fill ~ ~ ~ ~ 32 ~160 minecraft:air replace minecraft:scaffolding
execute as @e[type=minecraft:armor_stand,tag=middlenX] at @s run fill ~ ~ ~ ~-1 32 ~160 minecraft:air replace minecraft:scaffolding
execute as @e[type=minecraft:armor_stand,tag=middleZ] at @s run fill ~ ~ ~ ~160 32 ~ minecraft:air replace minecraft:scaffolding
execute as @e[type=minecraft:armor_stand,tag=middlenZ] at @s run fill ~ ~ ~ ~160 32 ~-1 minecraft:air replace minecraft:scaffolding

#stop slime machines during build period
execute if score *build_period settings matches 1.. if score tntwars_timer global < *build_period_s settings as @e[type=minecraft:armor_stand,tag=middleX] at @s run fill ~ ~ ~ ~ 32 ~160 minecraft:air replace #minecraft:tntwars
execute if score *build_period settings matches 1.. if score tntwars_timer global < *build_period_s settings as @e[type=minecraft:armor_stand,tag=middlenX] at @s run fill ~ ~ ~ ~-1 32 ~160 minecraft:air replace #minecraft:tntwars
execute if score *build_period settings matches 1.. if score tntwars_timer global < *build_period_s settings as @e[type=minecraft:armor_stand,tag=middleZ] at @s run fill ~ ~ ~ ~160 32 ~ minecraft:air replace #minecraft:tntwars
execute if score *build_period settings matches 1.. if score tntwars_timer global < *build_period_s settings as @e[type=minecraft:armor_stand,tag=middlenZ] at @s run fill ~ ~ ~ ~160 32 ~-1 minecraft:air replace #minecraft:tntwars
return 1