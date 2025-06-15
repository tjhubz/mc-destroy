### calculations based on a 0.5 raycast stepsize.
### if you change raycast stepsize, change *0.5 accordingly

# how many half blocks per step (4*0.5) = 2 blocks per tick
#scoreboard players set dst_per slowcast 100
# how many half blocks to travel (24*0.5) = 12 blocks
#scoreboard players set dst slowcast 100
#say run
tag @s[tag=!me] add me
#particle crit ~ ~ ~ 0 0 0 0 1
execute as @e[dx=0,tag=!me] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function main:server/util/raycast/detection


execute if block ~ ~ ~ #main:air unless score @s canRaytrace matches 0 positioned ^ ^ ^0.2 run function main:server/util/raycast/run
scoreboard players set @s canRaytrace 1
tag @s[tag=me] remove me
#tag @s add this
#scoreboard players add system slo_id 1
#scoreboard players operation @s slo_id = system slo_id
#summon minecraft:area_effect_cloud ~ ~1.45 ~ {Age:-2147483648,Duration:-1,WaitTime:-2147483648,Tags:["new","slowcast"]}

#execute as @e[type=area_effect_cloud,tag=slowcast,tag=new,limit=1] run function main:server/util/slowcast/zprivate/setup_entity
#tag @s remove this

return 1