require 'spec_helper'

describe Hindbaer::Region do
  
  before do
    File.open('spec/fixtures/session.nhsx') do |f|
      session = Hindbaer::Session.parse(f)
      track = session.tracks.first
      @region = track.regions.first
    end
  end
  
  it 'must return audio reference' do
    @region.ref.must_equal '1'
  end
  
  it 'must return name' do
    @region.name.must_equal 'Speak 1'
  end
  
  it 'must return start time' do
    @region.start.must_equal '00.0'
  end 
  
  it 'must return length' do
    @region.length.must_equal '11.099'
  end
  
  it 'must return offset' do
    @region.offset.must_equal '08.000'
  end
  
  it 'must return fade_in' do
    @region.fade_in.must_equal '01.000'
  end
  
  it 'must return fade_out' do
    @region.fade_out.must_equal '00.294'
  end
  
  it 'must return gain' do
    @region.gain.must_equal '-3.3'
  end
  
  it 'must return long-term equivalent level' do
    @region.leq.must_equal '-16.4'
  end
  
  it 'must return all fades' do
    @region.fades.first.must_be_kind_of Hindbaer::Fade
    @region.fades.size.must_equal 1
  end

end