
execute if entity @s[tag=selectJumper] as @a[tag=me] run tag @s add getJumper
execute if entity @s[tag=selectSnowman] as @a[tag=me] run tag @s add getSnowman
execute if entity @s[tag=selectSpearman] as @a[tag=me] run tag @s add getSpearman
execute if entity @s[tag=selectMultishot] as @a[tag=me] run tag @s add getMultishot
execute if entity @s[tag=selectJumper] as @a[tag=me,scores={canRaytrace=1}] run function main:oneshot/classes/select_class
execute if entity @s[tag=selectSnowman] as @a[tag=me,scores={canRaytrace=1}] run function main:oneshot/classes/select_class
execute if entity @s[tag=selectSpearman] as @a[tag=me,scores={canRaytrace=1}] run function main:oneshot/classes/select_class
execute if entity @s[tag=selectMultishot] as @a[tag=me,scores={canRaytrace=1}] run function main:oneshot/classes/select_class
execute if entity @s[tag=selectJumper] run scoreboard players set @a[tag=me] canRaytrace 0
execute if entity @s[tag=selectSnowman] run scoreboard players set @a[tag=me] canRaytrace 0
execute if entity @s[tag=selectSpearman] run scoreboard players set @a[tag=me] canRaytrace 0
execute if entity @s[tag=selectMultishot] run scoreboard players set @a[tag=me] canRaytrace 0
tag @s remove me

return 1