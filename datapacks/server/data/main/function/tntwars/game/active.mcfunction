#bossbar
execute if score tntwars_timer global matches 5.. run function main:tntwars/bossbar

#Infinite water
execute as @a[tag=tntwars,tag=hasBucket,team=!tutorial,nbt={SelectedItem:{id:"minecraft:bucket"}}] at @s run item replace entity @s weapon.mainhand with minecraft:water_bucket[minecraft:custom_name={text:"Infinite water bucket",color:"blue"},minecraft:item_name={extra:["Infinite water bucket"],text:"EMU"}] 1
execute as @a[tag=tntwars,tag=hasBucket,team=!tutorial,nbt={equipment:{offhand:{id:"minecraft:bucket"}}}] at @s run item replace entity @s weapon.offhand with minecraft:water_bucket[minecraft:custom_name={text:"Infinite water bucket",color:"blue"},minecraft:item_name={extra:["Infinite water bucket"],text:"EMU"}] 1

#scoreboard
execute if score tntwars_timer global matches 5.. run function main:tntwars/scoreboard


#border
execute if score tntwars_timer global matches 5.. run function main:tntwars/map/border
execute if score *launching settings matches 0 as @a[gamemode=!spectator,gamemode=!creative,x=-41,y=32,z=76,dx=80,dy=150,dz=47] at @s run tp @s ~ 30 ~

#out of island
execute as @e[type=minecraft:armor_stand,tag=spawn] at @s run tag @a[gamemode=survival,tag=tntwars,tag=!exit] add exit
execute if score tntwars_teams global matches 4 as @e[type=minecraft:armor_stand,tag=spawn] at @s positioned ~-25 0 ~-25 run tag @a[gamemode=!creative,gamemode=!spectator,dx=50,dy=32,dz=50,tag=exit,tag=tntwars] remove exit
execute if score tntwars_teams global matches 2 as @e[type=minecraft:armor_stand,tag=spawn] at @s positioned ~-22 0 ~-24 run tag @a[gamemode=!creative,gamemode=!spectator,dx=43,dy=32,dz=47,tag=exit,tag=tntwars] remove exit

execute if score *crossing settings matches 1 if score tntwars_timer global < *build_period_s settings run tellraw @a[gamemode=survival,tag=tntwars,tag=exit] [{text:"You can't leave your island until the build period is over.",color:"red",type:"text"}]
execute if score *crossing settings matches 1 if score tntwars_timer global < *build_period_s settings run kill @a[gamemode=survival,tag=tntwars,tag=exit]
execute if score *crossing settings matches 1 if score tntwars_timer global < *build_period_s settings run tag @a[gamemode=survival,tag=tntwars,tag=exit] remove exit

execute if score *crossing settings matches 0 run title @a[tag=tntwars,tag=exit] actionbar [{text:"Crossing is not enabled.",color:"red",type:"text"}]
execute if score *crossing settings matches 0 run effect clear @a[tag=tntwars,tag=exit] minecraft:saturation
execute if score *crossing settings matches 0 run effect give @a[tag=tntwars,tag=exit] minecraft:instant_damage 1 0 true
#execute if score *crossing settings matches 0 if score tntwars_timer global > *build_period_s settings run effect give @a[tag=tntwars,tag=exit] levitation 1 128 true
gamemode adventure @a[gamemode=survival,tag=tntwars,tag=exit]
bossbar set minecraft:nobuild players @a[gamemode=adventure,tag=tntwars,tag=exit]
gamemode survival @a[gamemode=adventure,tag=tntwars,tag=!exit]


#tag tnt with what side it came from
execute as @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white] at @s as @e[type=minecraft:tnt,distance=..5,tag=tagged] run function main:tntwars/tag_tnt
execute as @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white] at @s as @p[distance=..100,tag=tntwars] run function main:tntwars/tag_tnt
execute as @e[type=minecraft:tnt,tag=!tagged,tag=!red,tag=!blue,tag=!yellow,tag=!white] at @s run tag @s add tagged


#anti team grief
execute if score *team_grief settings matches 0 as @e[type=minecraft:armor_stand,tag=redSpawn,tag=active] at @s positioned ~-25 0 ~-25 as @e[type=minecraft:tnt,dx=50,dy=32,dz=50,tag=red,nbt={fuse:1s}] at @s unless block ~ ~ ~ minecraft:water run function main:server/util/explode_entity
execute if score *team_grief settings matches 0 as @e[type=minecraft:armor_stand,tag=blueSpawn,tag=active] at @s positioned ~-25 0 ~-25 as @e[type=minecraft:tnt,dx=50,dy=32,dz=50,tag=blue,nbt={fuse:1s}] at @s unless block ~ ~ ~ minecraft:water run function main:server/util/explode_entity
execute if score *team_grief settings matches 0 as @e[type=minecraft:armor_stand,tag=yellowSpawn,tag=active] at @s positioned ~-25 0 ~-25 as @e[type=minecraft:tnt,dx=50,dy=32,dz=50,tag=yellow,nbt={fuse:1s}] at @s unless block ~ ~ ~ minecraft:water run function main:server/util/explode_entity
execute if score *team_grief settings matches 0 as @e[type=minecraft:armor_stand,tag=whiteSpawn,tag=active] at @s positioned ~-25 0 ~-25 as @e[type=minecraft:tnt,dx=50,dy=32,dz=50,tag=white,nbt={fuse:1s}] at @s unless block ~ ~ ~ minecraft:water run function main:server/util/explode_entity

#anti team grief sheep kill
execute as @e[type=minecraft:sheep,tag=red] at @s unless entity @a[gamemode=survival,distance=..10,team=!red] run effect give @a[gamemode=survival,distance=..5] minecraft:weakness 1 255 true
execute as @e[type=minecraft:sheep,tag=blue] at @s unless entity @a[gamemode=survival,distance=..10,team=!blue] run effect give @a[gamemode=survival,distance=..5] minecraft:weakness 1 255 true
execute as @e[type=minecraft:sheep,tag=yellow] at @s unless entity @a[gamemode=survival,distance=..10,team=!yellow] run effect give @a[gamemode=survival,distance=..5] minecraft:weakness 1 255 true
execute as @e[type=minecraft:sheep,tag=white] at @s unless entity @a[gamemode=survival,distance=..10,team=!white] run effect give @a[gamemode=survival,distance=..5] minecraft:weakness 1 255 true

#death
execute as @a[tag=alive,tag=tntwars,scores={dead=1..}] at @s run function main:tntwars/util/spawnpoint
execute as @a[tag=alive,tag=tntwars,scores={dead=1..}] at @s run tag @s remove exit
execute as @a[tag=alive,tag=tntwars,scores={dead=1..}] at @s run gamemode spectator @s[gamemode=!spectator]
execute as @a[tag=alive,tag=tntwars,scores={dead=1..}] at @s unless score tntwars_timer global < *build_period_s settings run function main:tntwars/util/dead_check
execute as @a[scores={dead=1..}] at @s run scoreboard players reset @s dead
execute as @a[tag=alive,tag=tntwars] at @s if score @s death <= *respawn_time_t settings run function main:tntwars/util/death


#build period
execute if score tntwars_timer global < *build_period_s settings run kill @e[type=minecraft:tnt,distance=..400]
execute if score tntwars_timer global < *build_period_s settings run title @a[tag=tntwars] actionbar [{text:"TNT will not activate during the build period.",color:"yellow",type:"text"}]
execute if score tntwars_timer global < *build_period_s settings run effect give @e[type=minecraft:sheep,tag=!tutorial] minecraft:resistance 1 255
#execute if score tntwars_timer global < *build_period_s settings run effect give @e[type=sheep,tag=!tutorial] regeneration 1 255
execute if score tntwars_timer global < *build_period_s settings as @a[tag=tntwars,limit=1] as @e[type=minecraft:armor_stand,tag=borderXY] at @s positioned ~-10 ~ ~-10 run tp @e[type=minecraft:sheep,dx=170,dy=-100,dz=170,tag=blue] @e[tag=blueSpawn,limit=1]
execute if score tntwars_timer global < *build_period_s settings as @a[tag=tntwars,limit=1] as @e[type=minecraft:armor_stand,tag=borderXY] at @s positioned ~-10 ~ ~-10 run tp @e[type=minecraft:sheep,dx=170,dy=-100,dz=170,tag=red] @e[tag=redSpawn,limit=1]
execute if score tntwars_timer global < *build_period_s settings as @a[tag=tntwars,limit=1] as @e[type=minecraft:armor_stand,tag=borderXY] at @s positioned ~-10 ~ ~-10 run tp @e[type=minecraft:sheep,dx=170,dy=-100,dz=170,tag=yellow] @e[tag=yellowSpawn,limit=1]
execute if score tntwars_timer global < *build_period_s settings as @a[tag=tntwars,limit=1] as @e[type=minecraft:armor_stand,tag=borderXY] at @s positioned ~-10 ~ ~-10 run tp @e[type=minecraft:sheep,dx=170,dy=-100,dz=170,tag=white] @e[tag=whiteSpawn,limit=1]

#intruder warning
execute if score *alert settings matches 1 as @e[tag=redSpawn,tag=active] at @s positioned ~-25 0 ~-25 if entity @a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!red] run title @a[gamemode=!spectator,team=red] actionbar [{text:"WARNING ",color:"#FF0000",bold:1b,type:"text"},{text:"Enemies on your island: ",color:"#FF7F0F",bold:0b,type:"text"},{selector:"@a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!red]",bold:0b,type:"selector"}]
execute if score *alert settings matches 1 as @e[tag=redSpawn,tag=active] at @s positioned ~-25 0 ~-25 run effect give @a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!red] minecraft:glowing 1 0 true

execute if score *alert settings matches 1 as @e[tag=blueSpawn,tag=active] at @s positioned ~-25 0 ~-25 if entity @a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!blue] run title @a[gamemode=!spectator,team=blue] actionbar [{text:"WARNING ",color:"#FF0000",bold:1b,type:"text"},{text:"Enemies on your island: ",color:"#FF7F0F",bold:0b,type:"text"},{selector:"@a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!blue]",bold:0b,type:"selector"}]
execute if score *alert settings matches 1 as @e[tag=blueSpawn,tag=active] at @s positioned ~-25 0 ~-25 run effect give @a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!blue] minecraft:glowing 1 0 true

execute if score *alert settings matches 1 as @e[tag=yellowSpawn,tag=active] at @s positioned ~-25 0 ~-25 if entity @a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!yellow] run title @a[gamemode=!spectator,team=yellow] actionbar [{text:"WARNING ",color:"#FF0000",bold:1b,type:"text"},{text:"Enemies on your island: ",color:"#FF7F0F",bold:0b,type:"text"},{selector:"@a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!yellow]",bold:0b,type:"selector"}]
execute if score *alert settings matches 1 as @e[tag=yellowSpawn,tag=active] at @s positioned ~-25 0 ~-25 run effect give @a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!yellow] minecraft:glowing 1 0 true
execute if score *alert settings matches 1 as @e[tag=whiteSpawn,tag=active] at @s positioned ~-25 0 ~-25 if entity @a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!white] run title @a[gamemode=!spectator,team=white] actionbar [{text:"WARNING ",color:"#FF0000",bold:1b,type:"text"},{text:"Enemies on your island: ",color:"#FF7F0F",bold:0b,type:"text"},{selector:"@a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!white]",bold:0b,type:"selector"}]
execute if score *alert settings matches 1 as @e[tag=whiteSpawn,tag=active] at @s positioned ~-25 0 ~-25 run effect give @a[gamemode=survival,dx=50,dy=32,dz=50,tag=tntwars,team=!white] minecraft:glowing 1 0 true


#player kills sheep
execute as @a[gamemode=!spectator,tag=tntwars,scores={sheep=1..},team=red] run tag @e[type=minecraft:armor_stand,tag=redSpawn] add sheepKill
execute as @a[gamemode=!spectator,tag=tntwars,scores={sheep=1..},team=blue] run tag @e[type=minecraft:armor_stand,tag=blueSpawn] add sheepKill
execute as @a[gamemode=!spectator,tag=tntwars,scores={sheep=1..},team=yellow] run tag @e[type=minecraft:armor_stand,tag=yellowSpawn] add sheepKill
execute as @a[gamemode=!spectator,tag=tntwars,scores={sheep=1..},team=white] run tag @e[type=minecraft:armor_stand,tag=whiteSpawn] add sheepKill


#end
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=redSpawn,tag=active,tag=sheep] at @s unless entity @e[type=minecraft:sheep,tag=red] run function main:tntwars/game/eliminate
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=redSpawn,tag=active] at @s if score tntwars_red global matches 0 run kill @e[type=minecraft:sheep,tag=red]
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=redSpawn,tag=active] at @s if score tntwars_red global matches 0 run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Red",color:"red",bold:0b,type:"text"},{text:" team has been eliminated.",color:"gray",bold:0b,type:"text"}]
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=redSpawn,tag=active] at @s if score tntwars_red global matches 0 run tag @s remove sheep
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=redSpawn,tag=active] at @s if score tntwars_red global matches 0 run tag @s remove active

execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=blueSpawn,tag=active] at @s if score tntwars_blue global matches 0 run kill @e[type=minecraft:sheep,tag=blue]
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=blueSpawn,tag=active,tag=sheep] at @s unless entity @e[type=minecraft:sheep,tag=blue] run function main:tntwars/game/eliminate
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=blueSpawn,tag=active] at @s if score tntwars_blue global matches 0 run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Blue",color:"blue",bold:0b,type:"text"},{text:" team has been eliminated.",color:"gray",bold:0b,type:"text"}]
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=blueSpawn,tag=active] at @s if score tntwars_blue global matches 0 run tag @s remove sheep
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=blueSpawn,tag=active] at @s if score tntwars_blue global matches 0 run tag @s remove active

execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=yellowSpawn,tag=active,tag=sheep] at @s unless entity @e[type=minecraft:sheep,tag=yellow] run function main:tntwars/game/eliminate
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=yellowSpawn,tag=active] at @s if score tntwars_yellow global matches 0 run kill @e[type=minecraft:sheep,tag=yellow]
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=yellowSpawn,tag=active] at @s if score tntwars_yellow global matches 0 run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"Yellow",color:"yellow",bold:0b,type:"text"},{text:" team has been eliminated.",color:"gray",bold:0b,type:"text"}]
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=yellowSpawn,tag=active] at @s if score tntwars_yellow global matches 0 run tag @s remove sheep
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=yellowSpawn,tag=active] at @s if score tntwars_yellow global matches 0 run tag @s remove active

execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=whiteSpawn,tag=active,tag=sheep] at @s unless entity @e[type=minecraft:sheep,tag=white] run function main:tntwars/game/eliminate
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=whiteSpawn,tag=active] at @s if score tntwars_white global matches 0 run kill @e[type=minecraft:sheep,tag=white]
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=whiteSpawn,tag=active] at @s if score tntwars_white global matches 0 run tellraw @a[tag=tntwars] [{text:"ALERT ",color:"gold",bold:1b,type:"text"},{text:"The ",color:"gray",bold:0b,type:"text"},{text:"White",color:"white",bold:0b,type:"text"},{text:" team has been eliminated.",color:"gray",bold:0b,type:"text"}]
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=whiteSpawn,tag=active] at @s if score tntwars_white global matches 0 run tag @s remove sheep
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings as @e[tag=whiteSpawn,tag=active] at @s if score tntwars_white global matches 0 run tag @s remove active

execute store result score tntwars_active global if entity @e[type=minecraft:armor_stand,tag=spawn,tag=active]
execute if score tntwars_timer global matches 6.. if score tntwars_timer global < *match_limit_s settings if score tntwars_active global matches ..1 run function main:tntwars/game/end

#tag sheep with tnt
tag @e[type=minecraft:armor_stand,tag=spawn,tag=sheepKill] remove sheepKill
execute as @e[type=minecraft:tnt,tag=red,nbt={fuse:1s}] at @s if entity @e[type=minecraft:sheep,distance=..8,tag=!red] run tag @e[type=minecraft:armor_stand,tag=redSpawn] add sheepKill
execute as @e[type=minecraft:tnt,tag=blue,nbt={fuse:1s}] at @s if entity @e[type=minecraft:sheep,distance=..8,tag=!blue] run tag @e[type=minecraft:armor_stand,tag=blueSpawn] add sheepKill
execute as @e[type=minecraft:tnt,tag=yellow,nbt={fuse:1s}] at @s if entity @e[type=minecraft:sheep,distance=..8,tag=!yellow] run tag @e[type=minecraft:armor_stand,tag=yellowSpawn] add sheepKill
execute as @e[type=minecraft:tnt,tag=white,nbt={fuse:1s}] at @s if entity @e[type=minecraft:sheep,distance=..8,tag=!white] run tag @e[type=minecraft:armor_stand,tag=whiteSpawn] add sheepKill
execute as @e[type=minecraft:tnt,nbt={fuse:1s}] at @s if entity @e[type=minecraft:sheep,distance=..8] run data merge entity @s {fuse:0s}


#endgame
execute if score tntwars_timer global > *match_limit_s settings positioned 0 0 100 run kill @e[type=minecraft:tnt,distance=..300]

#deathmatch
execute if score *deathmatch_type settings matches 1 as @e[type=minecraft:spectral_arrow] at @s if block ~ ~ ~ minecraft:water run setblock ~ ~ ~ minecraft:sponge
execute if score *deathmatch_type settings matches 1 as @e[type=minecraft:spectral_arrow] at @s if block ~ ~ ~ minecraft:sponge run summon minecraft:tnt ~ ~ ~ {fuse:0s}
execute if score *deathmatch_type settings matches 1 as @e[type=minecraft:spectral_arrow,nbt={inGround:1b}] at @s run summon minecraft:tnt ~ ~ ~ {fuse:0s}
execute if score *deathmatch_type settings matches 1 as @e[type=minecraft:spectral_arrow,nbt={inGround:1b}] at @s run kill @s

execute if score *deathmatch_type settings matches 2 as @e[type=minecraft:chicken,tag=explode] at @s if block ~ ~-1 ~ minecraft:water run setblock ~ ~-1 ~ minecraft:sponge
execute if score *deathmatch_type settings matches 2 as @e[type=minecraft:chicken,tag=explode,nbt={OnGround:1b}] at @s run summon minecraft:tnt ~ ~ ~ {fuse:0s}
execute if score *deathmatch_type settings matches 2 as @e[type=minecraft:chicken,tag=explode,nbt={OnGround:1b}] at @s run kill @s
execute if score *deathmatch_type settings matches 2 as @e[type=minecraft:chicken,tag=explode] at @s if block ~ ~-1 ~ minecraft:bedrock run tp @s ~ ~-2 ~

return 1