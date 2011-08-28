require 'spec_helper'

describe Hindbaer::Clip do
  
  before do
    File.open('spec/fixtures/session.nhsx') do |f|
      session = Hindbaer::Session.parse(f)
      group = session.clipboard_groups.first
      @clip = group.clips.first
    end
  end
  
  it 'must return file reference' do
    @clip.ref.must_equal '2'
  end
  
  it 'must return name' do
    @clip.name.must_equal 'Group 1 1'
  end
  
  it 'must return length' do
    @clip.length.must_equal '04:03.669'
  end
  
  it 'must return long-term equivalent level' do
    @clip.leq.must_equal '-'
  end
  
end