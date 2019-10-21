class AlarmCommandCreator
  def initialize(vlc_command: 'cvlc', soundfile: )
    @soundfile = soundfile
    @vlc_command = vlc_command
  end

  def call
    "#{@vlc_command} --play-and-exit #{@soundfile}"
  end
end
