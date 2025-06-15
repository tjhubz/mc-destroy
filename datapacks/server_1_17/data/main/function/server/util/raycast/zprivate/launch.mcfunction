say launch
execute as @e[scores={slo_id=1..}] if score @s slo_id = @e[type=minecraft:area_effect_cloud,tag=slowcast,sort=nearest,limit=1] slo_id run tag @s add this

scoreboard players operation #temp slowcast = @s slo_dst_per
execute if score @s slo_dst matches 1.. run function main:server/util/slowcast/raycast
scoreboard players operation @s slo_dst -= @s slo_dst_per
execute if score @s slo_dst matches ..0 at @s run function main:server/util/slowcast/zprivate/end

tag @e[tag=this] remove this

return 1