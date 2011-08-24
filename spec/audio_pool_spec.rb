require 'spec_helper'

describe Hindbaer::AudioPool do
  
  before do
    session = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    @pool = session.audio_pool
  end
  
  it 'must return path to audio files' do
    @pool.path.must_equal 'Example session Files'
  end
  
  it 'must return location of audio file path' do
    @pool.location.must_equal '/Users/jamiehodge/Desktop'
  end
  
end