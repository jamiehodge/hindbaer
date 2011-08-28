require 'spec_helper'

describe Hindbaer::AudioPool do
  
  before do
    File.open('spec/fixtures/session.nhsx') do |f|
      session = Hindbaer::Session.parse(f)
      @pool = session.audio_pool
    end
  end
  
  it 'must return path to audio files' do
    @pool.path.must_equal 'Example session Files'
  end
  
  it 'must return location of audio file path' do
    @pool.location.must_equal '/Users/jamiehodge/Desktop'
  end
  
end