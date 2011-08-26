require 'spec_helper'

describe Hindbaer::Info do
  
  before do
    session = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    @info = session.info
  end
  
  it 'must return title' do
    @info.title.must_equal 'Suspendisse Dictum Feugiat Nisl Ut'
  end
  
  it 'must return subtitle' do
    @info.subtitle.must_equal 'Vestibulum Ante Ipsum Primis'
  end
  
  it 'must return description' do
    @info.description.must_equal 'Etiam at risus et justo'
  end
  
  it 'must return author' do
    @info.author.must_equal 'Jamie Hodge'
  end
  
  it 'must return link' do
    @info.link.must_equal 'http://'
  end
  
  it 'must return email' do
    @info.email.must_equal 'user@example.com'
  end
  
  it 'must return album' do
    @info.album.must_equal 'Nulla At Nulla'
  end
  
  it 'must return album track' do
    @info.album_track.must_equal '1'
  end
  
  it 'must return artist' do
    @info.artist.must_equal 'Lorem Ipsum Dolor'
  end
  
  it 'must return composer' do
    @info.composer.must_equal 'Quisque Eget Odio Ac'
  end
  
  it 'must return date' do
    @info.date.must_equal 'Today'
  end
  
  it 'must return copyright' do
    @info.copyright.must_equal '2011'
  end
  
  it 'must return genre' do
    @info.genre.must_equal 'Podcast'
  end
  
  it 'must return whether explicit' do
    @info.explicit?.must_equal true
  end
  
  it 'must return identifier' do
    @info.identifier.must_equal 'Lorem Ipsum Dolor Sit'
  end
  
  it 'must return reference' do
    @info.reference.must_equal 'Vivamus Hendrerit Arcu'
  end
  
  it 'must return keywords' do
    @info.keywords.must_equal %w{In Condimentum Facilisis}
  end
  
end