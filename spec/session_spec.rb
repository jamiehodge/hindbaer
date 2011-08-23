require 'spec_helper'

describe Hindbaer::Session do
  
  before do
    @session = Hindbaer::Session.new('spec/fixtures/project.nhsx')
  end
  
  it 'must return title' do
    @session.title.must_equal 'test'
  end
  
  it 'must return subtitle' do
    @session.subtitle.must_equal 'test'
  end
  
  it 'must return description' do
    @session.description.must_equal 'test'
  end
  
  it 'must return author' do
    @session.author.must_equal 'Moltke'
  end
  
  it 'must return album' do
    @session.album.must_equal 'test'
  end
  
  it 'must return keywords' do
    @session.keywords.must_equal ['test']
  end
  
  it 'must return all audio files' do
    @session.audio_pool.size.must_equal 46
  end
  
  it 'must return all tracks' do
    @session.tracks.size.must_equal 6
  end
  
  it 'must return all markers' do
    @session.markers.size.must_equal 3
  end
  
  it 'must calculate the total length in seconds' do
    @session.length.must_equal 10269.025000000001
  end
  
end