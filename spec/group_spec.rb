require 'spec_helper'

describe Hindbaer::Group do
  
  before do
    File.open('spec/fixtures/session.nhsx') do |f|
      session = Hindbaer::Session.parse(f)
      @group = session.clipboard_groups.first
    end
  end
  
  it 'must return caption' do
    @group.caption.must_equal 'Group 1'
  end
  
  it 'must return number of clips used' do
    @group.used.must_equal '2'
  end
  
  it 'must return all clips' do
    @group.clips.first.must_be_kind_of Hindbaer::Clip
    @group.clips.size.must_equal 2
  end
  
end