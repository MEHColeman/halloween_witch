require 'ya_gpio'
require_relative 'lib/spooker'
require_relative 'config'

pir   = YaGPIO.new(PIR_SENSOR, YaGPIO::INPUT)
spooker = Spooker.new(relay: YaGPIO.new(RELAY_SIGNAL, YaGPIO::OUTPUT),
                      alarm_sound: ALARM_SOUND)

pir.set_interrupt(YaGPIO::EDGE_RISING) do |high|
  spooker.start_alarm_sound
  spooker.flash_lights
  sleep 30
end

puts 'Ready for spookiness'

YaGPIO::wait([pir])

puts 'Spookiness over.'
