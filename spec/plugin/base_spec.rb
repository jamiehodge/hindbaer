require 'spec_helper'

describe Hindbaer::Plugin::Base do
  
  before do
    File.open('spec/fixtures/session.nhsx') do |f|
      session = Hindbaer::Session.parse(f)
      track = session.tracks.first
      @plugin = track.plugins.first
    end
  end
  
  it 'must return id' do
    @plugin.id.must_equal '0'
  end
  
  it 'must return name' do
    @plugin.name.must_equal 'Equalizer'
  end
  
  it 'must return uid (unique identifier)' do
    @plugin.u_i_d.must_equal 'nheq'
  end
  
end