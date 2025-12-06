# Plays anvil.land sound with random pitch variation
# Expects to be run at the tutorial position
# Generates random pitch between 1.3 and 1.7 (±0.2 from base 1.5)

# Generate random number between 0 and 20 (we'll divide by 100 to get pitch variation)
execute store result score #anvil_pitch temp run random value 0..20

# Add base pitch of 130 (representing 1.30)
scoreboard players add #anvil_pitch temp 130

# Play sound with calculated pitch (stored value / 100 = actual pitch)
# Example: 150 / 100 = 1.50 pitch
execute store result storage main:temp anvil_pitch float 0.01 run scoreboard players get #anvil_pitch temp

# Play the sound using macro
function main:server/util/zprivate/play_anvil_sound_macro with storage main:temp
