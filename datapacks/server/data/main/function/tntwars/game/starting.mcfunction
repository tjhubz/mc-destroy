scoreboard players set tntwars_timer global 0
function main:tntwars/game/tick

execute as @e[tag=game_countdown] run data merge entity @s {CustomName:{text:"Press again to cancel",color:"yellow",bold:0b}}
execute as @e[tag=game_countdown] run data merge entity @s {CustomNameVisible:1b}
execute as @e[tag=game_starter] at @s run setblock ~ ~-1 ~ minecraft:blackstone_wall
execute as @e[tag=game_starter] at @s run setblock ~ ~ ~ minecraft:warped_button[face=floor,powered=false]


execute as @a[x=-11,y=8,z=20,dx=5,dy=3,dz=11] run function help:f421885b89f9d93d9b1ebd2c3acf8278e9f72cbe44eed5d872ad7590f407c47a
execute as @a[x=6,y=8,z=20,dx=5,dy=3,dz=11] run function help:f421885b89f9d93d9b1ebd2c3acf8278e9f72cbe44eed5d872ad7590f407c47a
fill 6 8 25 6 10 26 minecraft:black_stained_glass
fill -6 8 25 -6 10 26 minecraft:black_stained_glass

return 1