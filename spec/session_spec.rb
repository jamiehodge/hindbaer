require 'spec_helper'

describe Hindbaer::Session do
  
  before do
    File.open('spec/fixtures/session.nhsx') do |f|
      @session = Hindbaer::Session.parse(f)
    end
  end
  
  it 'must return software version' do
    @session.version.must_equal 'Hindenburg Journalist Pro 1.10.1742'
  end
  
  it 'must return sample rate' do
    @session.samplerate.must_equal '44100'
  end
  
  it 'must return session info' do
    @session.info.must_be_instance_of Hindbaer::Info
  end
  
  it 'must return audio pool' do
    @session.audio_pool.must_be_instance_of Hindbaer::AudioPool
  end
  
  it 'must return all tracks' do
    @session.tracks.first.must_be_kind_of Hindbaer::Track
    @session.tracks.size.must_equal 5
  end
  
  it 'must return clipboard groups' do
    @session.clipboard_groups.first.must_be_kind_of Hindbaer::Group
    @session.clipboard_groups.size.must_equal 4
  end
  
  it 'must return all markers' do
    @session.markers.first.must_be_kind_of Hindbaer::Marker
    @session.markers.size.must_equal 2
  end
  
  it 'must calculate the total length in seconds' do
    @session.length.must_equal 10269.025000000001
  end
  
  it 'must render itself as xml' do
    puts @session.to_xml
  end
  
end