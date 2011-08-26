require 'spec_helper'

describe Hindbaer::Plugin::Base do
  
  before do
    project = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    track = project.tracks.first
    @plugin = track.plugins.first
  end
  
  it 'must return id' do
    @plugin.id.must_equal 0
  end
  
  it 'must return name' do
    @plugin.name.must_equal 'Equalizer'
  end
  
  it 'must return uid (unique identifier)' do
    @plugin.uid.must_equal 'nheq'
  end
  
end