require 'spec_helper'

describe Hindbaer::File do
  
  before do
    File.open('spec/fixtures/session.nhsx') do |f|
      session = Hindbaer::Session.parse(f)
      @file = session.audio_pool.files.first
    end
  end
  
  it 'must return id' do
    @file.id.must_equal '1'
  end
  
  it 'must return name' do
    @file.name.must_equal 'file1.wav'
  end
  
  it 'must return duration' do
    @file.duration.must_equal '2:51:09.025'
  end
  
  it 'must return the number of channels' do
    @file.channels.must_equal '2'
  end
  
  it 'must return leq' do
    @file.leq.must_equal '-10.4'
  end
  
  it 'must return dynamics' do
    @file.dyn.must_equal nil
  end
  
  it 'must return the original file path' do
    @file.original_path.must_equal '/path/to/file1.wav'
  end
  
end