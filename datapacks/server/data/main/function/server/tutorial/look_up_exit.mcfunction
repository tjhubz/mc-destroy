# Look up to exit tutorial
# Runs as each player in the tutorial, at their position
# Looking straight up (-90 pitch) for 0.5s triggers countdown, 3s countdown to exit

# If looking straight up (within 5 degrees of -90), increment counter
execute if entity @s[x_rotation=-90] run scoreboard players add @s look_up_exit 1
execute unless entity @s[x_rotation=-90..-85] run title @s reset
execute unless entity @s[x_rotation=-90..-85] run scoreboard players set @s look_up_exit 0

# If NOT looking straight up, reset counter and clear title if they had started
execute unless entity @s[x_rotation=-90..-85] if score @s look_up_exit matches 10.. run title @s clear
execute unless entity @s[x_rotation=-90..-85] run scoreboard players set @s look_up_exit 0

# After 10 ticks (0.5s), play pling sound and show initial title
execute if score @s look_up_exit matches 10 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
execute if score @s look_up_exit matches 10 run title @s times 0 30 10
execute if score @s look_up_exit matches 10.. run title @s title {"text":"Going back to lobby...","color":"yellow"}
execute if score @s look_up_exit matches 10 run title @s subtitle {"text":"3","color":"white"}

# Update countdown subtitle at 1-second intervals
execute if score @s look_up_exit matches 30 run title @s subtitle {"text":"2","color":"white"}
execute if score @s look_up_exit matches 50 run title @s subtitle {"text":"1","color":"white"}

# After 70 ticks (0.5s + 3s), return to lobby
execute if score @s look_up_exit matches 70 run function main:server/rejoin_player

return 1
