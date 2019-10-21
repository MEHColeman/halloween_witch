require 'minitest_helper'
require 'benchmark'
require 'spooker'

describe Spooker do
  let(:relay_mock) { Minitest::Mock.new }
  subject { Spooker.new(relay: relay_mock, alarm_sound: 'sound') }

  describe '.initialize' do
    it 'takes named arguments relay: and alarm_sound:' do
      expect(subject).must_be_kind_of Spooker
      ->{(Spooker.new(potato: 'hello'))}.must_raise ArgumentError
    end

    it 'raises an exception if correct arguments are not passed' do
      expect(subject).must_be_kind_of Spooker
      ->{(Spooker.new(potato: 'hello'))}.must_raise ArgumentError
    end
  end

  describe '.flash_lights' do
    it 'flashes the relay pin provided when initialised' do
      relay_mock.expect :high, nil
      relay_mock.expect :low, nil
      relay_mock.expect :high, nil
      relay_mock.expect :low, nil
      relay_mock.expect :high, nil
      relay_mock.expect :low, nil
      relay_mock.expect :high, nil
      relay_mock.expect :low, nil
      relay_mock.expect :high, nil
      relay_mock.expect :low, nil
      relay_mock.expect :high, nil
      relay_mock.expect :low, nil

      subject.flash_lights
      relay_mock.verify
    end

    it 'does not block' do
      expect(
        Benchmark.realtime { subject.start_alarm_sound }
      ).must_be :<, 0.5 # much less than length of sound clip
    end
  end
end
