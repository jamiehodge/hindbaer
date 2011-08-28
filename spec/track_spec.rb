require 'spec_helper'

describe Hindbaer::Track do
  
  before do
    File.open('spec/fixtures/session.nhsx') do |f|
      session = Hindbaer::Session.parse(f)
      @track = session.tracks.first
    end
  end
  
  it 'must return name' do
    @track.name.must_equal 'Speak'
  end
  
  it 'must return panning' do
    @track.pan.must_equal '0.025'
  end
  
  it 'must return all regions' do
    @track.regions.first.must_be_kind_of Hindbaer::Region
    @track.regions.size.must_equal 2
  end
  
  it 'must return all plugins' do
    @track.plugins.first.must_be_kind_of Hindbaer::Plugin::Base
    @track.plugins.size.must_equal 4
  end

end