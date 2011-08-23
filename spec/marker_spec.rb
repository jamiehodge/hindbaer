require 'spec_helper'

describe Hindbaer::Marker do
  
  before do
    project = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    @marker = project.markers.first
  end
  
  it 'must return id' do
    @marker.id.must_equal 1
  end
  
  it 'must return name' do
    @marker.name.must_equal 'In'
  end
  
  it 'must return time' do
    @marker.time.must_equal '01:01.000'
  end
end
