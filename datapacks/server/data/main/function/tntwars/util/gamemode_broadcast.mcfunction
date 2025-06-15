execute if score *preset settings matches 1 run tellraw @a[tag=tntwars] [{text:"\nCLASSIC",color:"dark_purple",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"Kill the other team's sheep to win! Island crossing is not allowed.",color:"light_purple",bold:0b,type:"text"}]

execute if score *preset settings matches 2 run tellraw @a[tag=tntwars] [{text:"\nCHAOS",color:"dark_red",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"Island crossing and launching is allowed! Be the last team standing to win. Bridges will form between islands when an adjacent team kills a sheep.",color:"red",bold:0b,type:"text"}]

execute if score *preset settings matches 3 run tellraw @a[tag=tntwars] [{text:"\nDEATHMATCH",color:"dark_blue",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"You only have one life, so use it well! Be the last team alive to win.",color:"aqua",bold:0b,type:"text"}]

#custom
execute if score *preset settings matches 0 run tellraw @a[tag=tntwars] [{text:"\nCUSTOM",color:"gold",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"Custom settings:",color:"yellow",bold:0b,type:"text"}]

execute if score *preset settings matches 0 if score *sheep_health settings matches 0 run tellraw @a[tag=tntwars] [{text:"SHEEP",color:"yellow",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"OFF",color:"yellow",bold:0b,type:"text"}]
execute if score *preset settings matches 0 if score *sheep_health settings matches 1.. run tellraw @a[tag=tntwars] [{text:"SHEEP HEALTH",color:"yellow",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{score:{name:"*sheep_health",objective:"settings"},color:"yellow",bold:0b,type:"score"}]

execute if score *preset settings matches 0 if score *crossing settings matches 0 run tellraw @a[tag=tntwars] [{text:"CROSSING",color:"yellow",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"OFF",color:"yellow",bold:0b,type:"text"}]
execute if score *preset settings matches 0 if score *crossing settings matches 1 run tellraw @a[tag=tntwars] [{text:"CROSSING",color:"yellow",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"ON",color:"yellow",bold:0b,type:"text"}]

execute if score *preset settings matches 0 if score *launching settings matches 0 run tellraw @a[tag=tntwars] [{text:"LAUNCHING",color:"yellow",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"OFF",color:"yellow",bold:0b,type:"text"}]
execute if score *preset settings matches 0 if score *launching settings matches 1 run tellraw @a[tag=tntwars] [{text:"LAUNCHING",color:"yellow",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"ON",color:"yellow",bold:0b,type:"text"}]

execute if score *preset settings matches 0 if score *bridges settings matches 0 run tellraw @a[tag=tntwars] [{text:"BRIDGES",color:"yellow",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"OFF",color:"yellow",bold:0b,type:"text"}]
execute if score *preset settings matches 0 if score *bridges settings matches 1 run tellraw @a[tag=tntwars] [{text:"BRIDGES",color:"yellow",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"ON",color:"yellow",bold:0b,type:"text"}]

execute if score *preset settings matches 0 if score *respawning settings matches 0 run tellraw @a[tag=tntwars] [{text:"RESPAWNING",color:"yellow",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"OFF",color:"yellow",bold:0b,type:"text"}]
execute if score *preset settings matches 0 if score *respawning settings matches 1 run tellraw @a[tag=tntwars] [{text:"RESPAWNING",color:"yellow",bold:1b,type:"text"},{text:" - ",color:"gray",bold:0b,type:"text"},{text:"ON",color:"yellow",bold:0b,type:"text"}]

tellraw @a[tag=tntwars] [{text:" ",type:"text"}]

return 1