# Adjust these as appropriate:

PIR_SENSOR = 22
RELAY_SIGNAL = 27

# Use this format to play one sound when PIR is triggered
#ALARM_SOUND = 'sounds/witch_cackle_1.m4a'

# Or pass an array of sounds, and one will be selected at random
ALARM_SOUND = ['sounds/witch_cackle_1.m4a',
               'sounds/witch_cackle_2.m4a',
               'sounds/witch_cackle_3.m4a',
               'sounds/witch_cackle_4.m4a']

# run VLC on a mac
VLC_COMMAND = '/Applications/VLC.app/Contents/MacOS/VLC'

# run VLC on raspbian
#VLC_COMMAND = 'cvlc'
