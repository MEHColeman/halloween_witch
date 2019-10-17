# Halloween Witch Pi Project

Make a cackling witch silhouette with a raspberry pi, a PIR sensor and a relay
powering a light bulb.  Connect your lighting circuit to the NO (normally open)
relay connection.

Pin connections and the sound played when triggered can be configured by
changing the values in `config.rb`, but by default are:

* The PIR connects to 5V, GND and pin 22 for the output.
* The relay connects to 3.3V, GND and pin 27 for the signal.
Alarm sound: sounds/witch_cackle.mp3

Some PIRs come with two potentiometers: For the HC-SR501, when viewing with the
Fresnel lens on top, the potentiometer on the left adjusts the activation time
for the PIR signal. The one on the right adjusts the activation sensitivity of
the sensor.

It also has a yellow jumper that changes the way the activation signal is sent.
You want this set to "LOW" which means that a signal is sent 1 time per
activation period, not multiple times.

You also need to create your own scary silhouette!

## Prerequisites

You need to have ruby installed.  I do this with rbenv. (This can also be
installed from a package `apt-get install rbenv`).
```
$ rbenv install 2.4.1   # install ruby version 2.4.1
$ rbenv local 2.4.1     # use this version locally
$ bundle                # install the ruby libraries used by this program
```

The script makes use of vlc to play sounds, but this come pre-installed on
raspbian.

## Running
```
bundle exec ruby scare_em.rb
```

### My Set-up

I have the relay connected to a bunch of LED lamps. These are set to illuminate
a white sheet with cardboard cut-outs creating the sillouettes.
You can find somee greate spooky soundtracks on youtube. I liked this one:
https://www.youtube.com/watch?v=Wxu_WxO3suI
I play this separately as a background track, and use a short witch cackle as
the alarm sound.

# Next Steps

I tried using the audio-playback gem to have all the sound playback as part of
the application, but I couldn't install it on raspbian. Still investigating
that.  The tests can be found on the `spike/audio_tests` branch. Also I wanted
to add an option to play a spooky background track, but I could only get one
sound to play at a time.
