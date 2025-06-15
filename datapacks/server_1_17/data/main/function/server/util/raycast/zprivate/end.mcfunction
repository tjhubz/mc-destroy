say end
execute as @e[tag=!slowcast,scores={slo_id=1..}] if score @s slo_id = @e[type=minecraft:area_effect_cloud,tag=slowcast,sort=nearest,limit=1] slo_id run function main:server/util/slowcast/end
kill @s

return 1