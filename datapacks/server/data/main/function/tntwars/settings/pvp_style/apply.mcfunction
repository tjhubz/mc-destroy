#apply pvp style attack speed to player
#1.8 style: instant attacks (base 1024)
#1.9 style: vanilla cooldown (reset to default 4.0)

execute if score *pvp_style settings matches 1 run attribute @s minecraft:attack_speed base set 1024
execute if score *pvp_style settings matches 0 run attribute @s minecraft:attack_speed base reset

return 1
