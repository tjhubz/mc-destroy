#execute at @e[dx=30,dy=100,dz=30,type=area_effect_cloud,tag=tutorial_cannon] if block ~ ~ ~ stone_button[face=floor,powered=true] run clone 977 1 988 982 2 990 ~-5 ~-1 ~-2
#execute at @e[limit=1,sort=random,dx=30,dy=100,dz=30,type=area_effect_cloud,tag=tutorial_cannon] run setblock ~ ~ ~ stone_button[face=floor,powered=true] replace

tag @e[type=minecraft:marker,dx=30,dy=100,dz=30,tag=tutorial_cannon,sort=random,limit=1] add fire
execute at @e[type=minecraft:marker,dx=30,dy=100,dz=30,tag=tutorial_cannon,tag=fire] run summon minecraft:tnt ~-5 ~ ~-1 {fuse:80s}
execute at @e[type=minecraft:marker,dx=30,dy=100,dz=30,tag=tutorial_cannon,tag=fire] run summon minecraft:tnt ~-4 ~-1 ~-1 {fuse:0s}
tag @e[type=minecraft:marker,dx=30,dy=100,dz=30,tag=tutorial_cannon,tag=fire] remove fire
return 1