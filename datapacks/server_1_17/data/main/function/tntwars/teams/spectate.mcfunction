tellraw @s [{text:"Spectator mode activated. Fly back to spawn to exit.",color:"yellow",type:"text"}]
team join main @s
gamemode spectator @s
playsound minecraft:ui.button.click master @s ~ ~1000 ~ 10000 1

return 1