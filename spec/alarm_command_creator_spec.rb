require 'minitest_helper'
require 'alarm_command_creator'

describe AlarmCommandCreator do
  subject { AlarmCommandCreator.new(vlc_command: 'vlc', soundfile: 'sound') }

  describe '.initialize' do
    it 'takes an optional argument specifying the vlc command' do
      expect(AlarmCommandCreator.new(soundfile: 'sound'))
        .must_be_kind_of AlarmCommandCreator
    end

    it 'must take a string argument representing a sound file' do
      ->{(AlarmCommandCreator.new(vlc_command: 'hello'))}.must_raise ArgumentError
    end

    it 'raises an exception if correct arguments are not passed' do
      ->{(AlarmCommandCreator.new(potato: 'hello'))}.must_raise ArgumentError
    end
  end

  describe '.call' do
    it 'returns an executable vlc command string that will play the sound' do
      cc = AlarmCommandCreator.new(vlc_command: 'vlc_command',
                                   soundfile: 'soundfile.mp3')
      expect(cc.call).must_equal 'vlc_command --play-and-exit soundfile.mp3'
    end

    it 'uses a ramdom file if initialised with an array' do
      cc = AlarmCommandCreator.new(vlc_command: 'DDD',
                                   soundfile: ['1','2','3','4'])
      expect(
        ['DDD --play-and-exit 1',
         'DDD --play-and-exit 2',
         'DDD --play-and-exit 3',
         'DDD --play-and-exit 4']
      ).must_include(cc.call)
    end
  end
end
