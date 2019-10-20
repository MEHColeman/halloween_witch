require_relative '../config'

class Spooker
  def initialize(relay:, alarm_sound:)
    @relay = relay
    @alarm_sound = alarm_sound
  end

  def start_alarm_sound
    fork { exec("#{VLC_COMMAND} --play-and-exit #{@alarm_sound}") }
  end

  # below 3 Hz should avoid photosensitive epilepsy
  def flash_lights
    sleep 0.9
    @relay.high
    sleep 0.3
    @relay.low
    sleep 0.3
    @relay.high
    sleep 0.5
    @relay.low
    sleep 0.3
    @relay.high
    sleep 0.3
    @relay.low
    sleep 0.4
    @relay.high
    sleep 0.5
    @relay.low
    sleep 0.4
    @relay.high
    sleep 0.3
    @relay.low
    sleep 0.3
    @relay.high
    sleep 1.3
    @relay.low
  end
end
