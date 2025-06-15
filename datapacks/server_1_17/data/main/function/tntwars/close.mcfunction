#remove barrier
execute if entity @s[tag=tntwarsclose] if block 0 9 24 minecraft:iron_bars run fill 3 8 24 -3 11 23 minecraft:air destroy


execute if entity @s[tag=!tntwarsclose] unless block 0 9 24 minecraft:iron_bars run setblock 0 9 23 minecraft:dark_oak_wall_sign[facing=north]{front_text:{messages:[{text:"CLOSED",color:"red",bold:1b,type:"text"},'',{text:"TNTWars will be",color:"yellow",type:"text"},{text:"back soon!",color:"yellow",type:"text"}]}} destroy
execute if entity @s[tag=!tntwarsclose] unless block 0 9 24 minecraft:iron_bars run fill 3 8 24 -3 11 24 minecraft:iron_bars destroy

execute if block 0 9 24 minecraft:iron_bars run tag @s add tntwarsclose
execute unless block 0 9 24 minecraft:iron_bars run tag @s remove tntwarsclose
return 1