require 'spec_helper'

describe Hindbaer::Fade do

  before do
    File.open('spec/fixtures/session.nhsx') do |f|
      session = Hindbaer::Session.parse(f)
      track = session.tracks[2]
      region = track.regions.first
      @fade = region.fades.first
    end
  end
  
  it 'must return start time' do
    @fade.start_time.must_equal '06.426'
  end
  
  it 'must return length' do
    @fade.length.must_equal '00.351'
  end
  
  it 'must return gain' do
    @fade.gain.must_equal '-11.4868'
  end
end
