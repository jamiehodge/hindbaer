require 'spec_helper'

describe Hindbaer::Audio do
  
  before do
    project = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    @audio = project.audio_pool.first
  end
  
  it 'must return id' do
    @audio.id.must_equal 1
  end
  
  it 'must return name' do
    @audio.name.must_equal '110810_08.WAV'
  end
  
  it 'must return duration' do
    @audio.duration.must_equal '2:51:09.025'
  end
  
  it 'must return the number of channels' do
    @audio.num_channels.must_equal 2
  end
  
  it 'must return leq' do
    @audio.leq.must_equal -10.4
  end
  
  it 'must return dynamics' do
    @audio.dynamics.must_equal 0.0
  end
  
  it 'must return the original file path' do
    @audio.original_path.must_equal '/Volumes/Macintosh HD/CCC/Dag 1/110810_08.WAV'
  end
  
end