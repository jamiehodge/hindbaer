require 'spec_helper'

describe Hindbaer::Group do
  
  before do
    @session = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    @group = @session.clipboard_groups.first
  end
  
  it 'must return caption' do
    @group.caption.must_equal 'Group 1'
  end
  
  it 'must return number of clips used' do
    @group.num_clips_used.must_equal 2
  end
  
  it 'must return all clips' do
    @group.clips.first.must_be_kind_of Hindbaer::Clip
    @group.clips.size.must_equal 2
  end
  
  it 'must return session' do
    @group.session.must_equal @session
  end
  
end