require 'spec_helper'

describe Hindbaer::Session do
  
  before do
    @session = Hindbaer::Session.new('spec/fixtures/project.nhsx')
  end
  
  it 'must return software version' do
    @session.software_version.must_equal 'Hindenburg Journalist Pro 1.12.1752'
  end
  
  it 'must return sample rate' do
    @session.sample_rate.must_equal '44100'
  end
  
  it 'must return title' do
    @session.title.must_equal 'Example session'
  end
  
  it 'must return subtitle' do
    @session.subtitle.must_equal 'An example session'
  end
  
  it 'must return description' do
    @session.description.must_equal 'An example description'
  end
  
  it 'must return author' do
    @session.author.must_equal 'Jamie Hodge'
  end
  
  it 'must return album' do
    @session.album.must_equal 'An example album'
  end
  
  it 'must return album track' do
    @session.album_track.must_equal 'An example track'
  end
  
  it 'must return keywords' do
    @session.keywords.must_equal ['example', 'test']
  end
  
  it 'must return all audio files' do
    @session.audio_pool.size.must_equal 4
  end
  
  it 'must return path to audio files' do
    @session.audio_pool_path.must_equal 'Example session Files'
  end
  
  it 'must return location of audio file path' do
    @session.audio_pool_location.must_equal '/Users/jamiehodge/Desktop'
  end
  
  it 'must return all tracks' do
    @session.tracks.size.must_equal 5
  end
  
  it 'must return all markers' do
    @session.markers.size.must_equal 2
  end
  
  it 'must calculate the total length in seconds' do
    @session.length.must_equal 10269.025000000001
  end
  
end