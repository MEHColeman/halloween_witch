require_relative '../config'
require_relative 'alarm_command_creator'

class Spooker
  def initialize(relay:, alarm_sound:)
    @relay = relay
    @alarm_command_creator = AlarmCommandCreator.new(vlc_command: VLC_COMMAND,
                                                     soundfile: alarm_sound)
  end

  def start_alarm_sound
    fork { exec( @alarm_command_creator.call ) }
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
