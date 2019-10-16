require 'ya_gpio'
require_relative 'config'

pir   = YaGPIO.new(PIR_SENSOR, YaGPIO::INPUT)
relay = YaGPIO.new(RELAY_SIGNAL, YaGPIO::OUTPUT)

# Flash the lights when the PIR triggers
# below 3 Hz should avoid photosensitive epilepsy
pir.set_interrupt(YaGPIO::EDGE_RISING) do |high|
    fork { exec("cvlc --play-and-exit #{ALARM_SOUND}") }

    sleep 0.9
    relay.high
    sleep 0.3
    relay.low
    sleep 0.3
    relay.high
    sleep 0.5
    relay.low
    sleep 0.3
    relay.high
    sleep 0.3
    relay.low
    sleep 0.4
    relay.high
    sleep 0.5
    relay.low
    sleep 0.4
    relay.high
    sleep 0.3
    relay.low
    sleep 0.3
    relay.high
    sleep 1.3
    relay.low
    sleep 20
end

puts 'ready'

YaGPIO::wait([pir])
puts 'wait() loop terminated'
