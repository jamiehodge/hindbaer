require 'spec_helper'

describe Hindbaer::Track do
  
  before do
    project = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    @track = project.tracks.first
  end
  
  it 'must return name' do
    @track.name.must_equal 'Speak'
  end
  
  it 'must return panning' do
    @track.pan.must_equal '0.025'
  end
  
  it 'must return all regions' do
    @track.regions.size.must_equal 2
  end
end