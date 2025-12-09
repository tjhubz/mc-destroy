#cycle through time options (0=day, 1=noon, 2=sunset, 3=night, 4=midnight)
execute if entity @s[tag=!set] run scoreboard players add *time_of_day settings 1
execute if score *time_of_day settings matches 5.. run scoreboard players set *time_of_day settings 0
playsound minecraft:ui.button.click master @s[tag=!set,tag=!silent] ~ ~100 ~ 10000 1

#set time immediately
execute if score *time_of_day settings matches 0 run time set day
execute if score *time_of_day settings matches 1 run time set noon
execute if score *time_of_day settings matches 2 run time set 12000
execute if score *time_of_day settings matches 3 run time set night
execute if score *time_of_day settings matches 4 run time set midnight

#refresh sign via map/set
function main:tntwars/settings/map/set

return 1
