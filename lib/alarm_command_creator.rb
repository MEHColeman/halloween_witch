class AlarmCommandCreator
  def initialize(vlc_command: 'cvlc', soundfile: )
    @soundfiles = Array(soundfile)
    @vlc_command = vlc_command
  end

  def call
    "#{@vlc_command} --play-and-exit #{@soundfiles.sample}"
  end
end
