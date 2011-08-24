require 'spec_helper'

describe Hindbaer::Track do
  
  before do
    @session = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    @track = @session.tracks.first
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
    @track.plugins.first.must_be_kind_of Hindbaer::Plugin
    @track.plugins.size.must_equal 1
  end
  
  it 'must return parent session' do
    @track.session.must_equal @session
  end
end