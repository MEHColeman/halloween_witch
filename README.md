# Halloween Witch Pi Project

Make a cackling witch silhouette with a raspberry pi, a PIR sensor and a relay powering a light bulb.
Connect your lighting circuit to the NO (normally open) relay connection.

Pin connections and and the sound played when triggered can be configured by changing the values in config.rb, but by default are:

The PIR connects to 5V, GND and pin 14 for the output.
The relay connects to 3.3V, GND and pin 17 for the signal.
Alarm sound: sounds/witch_cackle.mp3

You also need to create your own scary silhouette!

## Prerequisites

You need to have ruby installed.
I do this with rbenv. (This can also be installed from a package `apt-get install rbenv`).
```
rbenv install 2.4.1   # install ruby version 2.4.1
rbenv local 2.4.1     # use this version locally
bundle                # install the ruby libraries used by this program
```

## Running
```
bundle exec ruby scare_em.rb
```
