require 'spec_helper'

describe Hindbaer::Clip do
  
  before do
    @session = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    @group = @session.clipboard_groups.first
    @clip = @group.clips.first
  end
  
  it 'must return file reference' do
    @clip.reference.must_be_kind_of Hindbaer::File
    @clip.reference.id.must_equal 2
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
  
  it 'must return parent group' do
    @clip.group.must_equal @group
  end
end