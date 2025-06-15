execute if entity @s[scores={loadingTimer=1}] at @s run team join tutorial @s
tag @s[tag=queue] remove queue

execute if entity @s[scores={loadingTimer=1..60}] run function help:2052641c18fa593867e50dc8be673eb2cfecd6576d586419e1298c792d11aedf
title @s[scores={loadingTimer=1}] times 0 60 10
effect give @s[scores={loadingTimer=1}] minecraft:blindness 3 0 true
effect give @s[scores={loadingTimer=1}] minecraft:invisibility 10 100 true

#title @s[scores={loadingTimer=1..}] title ""

##SKIP
scoreboard players set @s[scores={loadingTimer=1}] loadingTimer 60

title @s[scores={loadingTimer=1..59}] title [{text:"Loading...",color:"dark_gray",type:"text"}]
title @s[scores={loadingTimer=60}] title [{text:"Loading..",color:"dark_gray",type:"text"},{text:".",color:"gray",type:"text"}]
title @s[scores={loadingTimer=62}] title [{text:"Loading.",color:"dark_gray",type:"text"},{text:".",color:"gray",type:"text"},{text:".",color:"gold",type:"text"}]
title @s[scores={loadingTimer=64}] title [{text:"Loading",color:"dark_gray",type:"text"},{text:".",color:"gray",type:"text"},{text:"..",color:"gold",type:"text"}]
title @s[scores={loadingTimer=66}] title [{text:"Loadin",color:"dark_gray",type:"text"},{text:"g",color:"gray",type:"text"},{text:"...",color:"gold",type:"text"}]
title @s[scores={loadingTimer=68}] title [{text:"Loadi",color:"dark_gray",type:"text"},{text:"n",color:"gray",type:"text"},{text:"g...",color:"gold",type:"text"}]
title @s[scores={loadingTimer=70}] title [{text:"Load",color:"dark_gray",type:"text"},{text:"i",color:"gray",type:"text"},{text:"ng...",color:"gold",type:"text"}]
title @s[scores={loadingTimer=72}] title [{text:"Loa",color:"dark_gray",type:"text"},{text:"d",color:"gray",type:"text"},{text:"ing...",color:"gold",type:"text"}]
title @s[scores={loadingTimer=74}] title [{text:"Lo",color:"dark_gray",type:"text"},{text:"a",color:"gray",type:"text"},{text:"ding...",color:"gold",type:"text"}]
title @s[scores={loadingTimer=76}] title [{text:"L",color:"dark_gray",type:"text"},{text:"o",color:"gray",type:"text"},{text:"ading...",color:"gold",type:"text"}]
title @s[scores={loadingTimer=78}] title [{text:"L",color:"gray",type:"text"},{text:"oading...",color:"gold",type:"text"}]
title @s[scores={loadingTimer=80}] title [{text:"Loading...",color:"gold",type:"text"}]
title @s[scores={loadingTimer=90}] title [{text:"",type:"text"}]
title @s[scores={loadingTimer=90}] subtitle [{text:"Welcome to DESTROY!",color:"green",type:"text"}]

execute if entity @s[scores={loadingTimer=90..1000}] at @s run effect give @s minecraft:invisibility 1 255 true
execute if entity @s[scores={loadingTimer=1..1000}] at @s run function help:e165d0a1839e619501e921d73d96ff132a5342589f464cd09409545eae99bd9f
execute if entity @s[scores={loadingTimer=1..1000}] at @s run effect give @s minecraft:weakness 1 255 true

#scene 1
#execute as @a[scores={loadingTimer=90}] at @s run tp @s 0 25 0 facing 0 15 -36
#execute as @s[scores={loadingTimer=90..160}] at @s run tp @s ^ ^ ^-.05 facing 0 15 -36

#execute as @s[scores={loadingTimer=100}] run particle minecraft:explosion 0 20 -36 1.3 1.5 0.8 1 75 force
#execute as @s[scores={loadingTimer=100}] run particle large_smoke 0 20 -36 1.3 1.5 0.8 0.7 50 force
#execute as @s[scores={loadingTimer=100}] run playsound minecraft:entity.creeper.primed master @a 0 20 -36 10 1
#execute as @s[scores={loadingTimer=100}] run playsound minecraft:entity.generic.explode master @a 0 20 -36 10 1


#scene 2
execute if entity @s[scores={loadingTimer=90}] at @s run function help:8aca04769dca168c1ff199bf1cefe051dd570106219ae97028d86feae0dd1b49
execute if entity @s[scores={loadingTimer=90..240}] at @s run function help:a9b115b6143e45fb87f2456e3783d0283f540610b733dc46df4ff8d53549fefb


#scene 3
execute if entity @s[scores={loadingTimer=321}] at @s run function help:5c2a515838a9b9dfa915abc9a4f96d886c5ffe727f98157c4db04f703da7ecef
execute if entity @s[scores={loadingTimer=321}] at @s run tellraw @s [{text:"\nThe main game, TNT Wars, uses a queue system.\n",color:"yellow",type:"text"}]
execute if entity @s[scores={loadingTimer=321}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~100 ~ 10000 1
execute if entity @s[scores={loadingTimer=321..445}] at @s run function help:4ad7b999f78fd6e2e8bd562b1a9161abba734ebd632577042bdc0be4942ada07
execute if entity @s[scores={loadingTimer=446}] at @s run tellraw @s [{text:"\nThis means you must join the queue before the game starts in order to play.\n",color:"yellow",type:"text"}]
execute if entity @s[scores={loadingTimer=446}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~100 ~ 10000 1
execute if entity @s[scores={loadingTimer=446..560}] at @s run function help:798547e50879c028e77d382660a1e90dd18e2d955230b4212d7b1e4aa79de808

#scene 4
execute if entity @s[scores={loadingTimer=561..629}] at @s run function help:0cf8756e6c3c98251e1640715d5a10b13ae132112f2f365aca246b6b0de22cfb
execute if entity @s[scores={loadingTimer=630..660}] at @s run function help:a1d41ad539d8346260907785f38d90d4eea76668eb75a61ff0c7119075173cdd
execute if entity @s[scores={loadingTimer=661..679}] at @s run function help:067dbe26175a9e8b6875313de103a2d48a9c324c541d13488d98017bb5d1b6d1
execute if entity @s[scores={loadingTimer=680}] at @s run tellraw @s [{text:"\nOver here, you can customize your hotbar.\n",color:"yellow",type:"text"}]
execute if entity @s[scores={loadingTimer=680}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~100 ~ 10000 1
execute if entity @s[scores={loadingTimer=680..720}] at @s run function help:e6630cf24cd27058eaefe3f19e4bc06e95f5d21fa5848deccf52e32130805548

#scene 5
execute if entity @s[scores={loadingTimer=721..739}] at @s run function help:067dbe26175a9e8b6875313de103a2d48a9c324c541d13488d98017bb5d1b6d1
execute if entity @s[scores={loadingTimer=740}] at @s run tellraw @s [{text:"\nYou can get information over here.\n",color:"yellow",type:"text"}]
execute if entity @s[scores={loadingTimer=740}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~100 ~ 10000 1
execute if entity @s[scores={loadingTimer=740..780}] at @s run function help:c5f880f031b10beb4c3a13b755ba9eac586f2425495f5dcaa6cfdc5b9ed6398a

#scene 6
execute if entity @s[scores={loadingTimer=781..799}] at @s run function help:067dbe26175a9e8b6875313de103a2d48a9c324c541d13488d98017bb5d1b6d1
execute if entity @s[scores={loadingTimer=800}] at @s run tellraw @s [{text:"\nGame settings can be changed over here.\n",color:"yellow",type:"text"}]
execute if entity @s[scores={loadingTimer=800}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~100 ~ 10000 1
execute if entity @s[scores={loadingTimer=800..840}] at @s run function help:082a49683c24c1e7864cc90c8129e9f7a0ae7d53c45eda122c45c1ef79bdd491

#scene 7
execute if entity @s[scores={loadingTimer=841..850}] at @s run function help:067dbe26175a9e8b6875313de103a2d48a9c324c541d13488d98017bb5d1b6d1
execute if entity @s[scores={loadingTimer=851}] at @s run tellraw @s [{text:"\nFinally, you can play our other minigame SoulShot by jumping through these portals.\n",color:"yellow",type:"text"}]
execute if entity @s[scores={loadingTimer=851}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~100 ~ 10000 1
execute if entity @s[scores={loadingTimer=851..940}] at @s run function help:dafda49c66fe579f96062c836e084ef0c09aee451eccf3588313846c60ce108e

#scene 8
execute if entity @s[scores={loadingTimer=941..950}] at @s run function help:067dbe26175a9e8b6875313de103a2d48a9c324c541d13488d98017bb5d1b6d1
execute if entity @s[scores={loadingTimer=951}] at @s run tellraw @s [{text:"\nNow, let's get you ready for battle.\n",color:"yellow",type:"text"}]
execute if entity @s[scores={loadingTimer=951}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~100 ~ 10000 1
execute if entity @s[scores={loadingTimer=951..960}] at @s run function help:90fb34553a9efd2548c9af78818495c6b35dcf799467f6d286ead018c8a82146


#end
execute if entity @s[scores={loadingTimer=961..999}] at @s run tp @s 0 ~.5 0
execute if entity @s[scores={loadingTimer=240}] at @s run effect give @s minecraft:blindness 2 0 true
execute if entity @s[scores={loadingTimer=240}] at @s run function help:ee545a6b9c44e49e9ca35f83875357cb8882d5adf44e03cbccab9ed417e54e0a
execute if entity @s[scores={loadingTimer=240}] at @s run team join main

scoreboard players reset @s[scores={loadingTimer=241..}] loadingTimer
scoreboard players add @s[scores={loadingTimer=1..}] loadingTimer 1

return 1