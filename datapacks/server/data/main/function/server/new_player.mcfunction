gamemode adventure

function help:053ec2770a2521e2e1ad8cf032d1b8acb2b9ca68311b87d47ea6bf5bbf5d934c
spawnpoint @s 0 11 0

scoreboard players add *total_players global 1
#tellraw @a [{"text":"Please welcome ","bold":false,"color":"green"},{"selector":"@s","bold":true,"color":"dark_green"},{"text":" to Destroy!","bold":false,"color":"green"}]
#tellraw @s [{"text":"\nWelcome to ","color":"yellow","bold":false},{"text":"Destroy","color":"red","bold":true},{"text":"! If you aren't sure what TNT Wars is, walk ahead to the tutorial!\n","color":"yellow","bold":false}]
scoreboard players set @s loadingTimer 1
scoreboard players add @s souls 0

team join main @s

tag @s add notNew

return 1