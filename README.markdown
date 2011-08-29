Hindbær
=======

Parse, modify and generate [Hindenburg Journalist](http://hindenburgsystems.com/)
audio session files.

Installation
------------

    gem install hindbaer
    
Usage
-----

Parse a session file:

    session = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    
    session.software_version
    session.sample_rate
    
    session.info.title
    session.info.subtitle
    session.info.description
    session.info.author
    session.info.album
    session.ínfo.track
    session.info.keywords
    # etc.
    
    session.length # in seconds
    
Render Session object as xml:

    session.to_xml
    
Retrieve all tracks:

    track = session.tracks.first
    track.name
    track.pan
    
Retrieve all track plugins:

    plugin = track.plugins.first
    plugin.id
    plugin.name
    plugin.uid
    
There is currently support for the four default plugins and their attributes.
    
Retrieve all regions for a given track:

    region = tracks.first.regions.first
    region.ref # audio file reference
    region.name
    region.start
    region.length
    region.offset
    region.fade_in
    region.fade_out
    region.gain
    region.leq # (long-term equivalent level)
    
Retrieve all fades for a given region:

    fade = regions.first.fades.first
    fade.start
    fade.length
    fade.gain
    
Retrieve all clipboard groups and their clips:

    group = session.clipboard_groups.first
    group.caption
    group.used
    
    clip = group.clips.first
    clip.ref
    clip.name
    clip.length
    clip.leq # (long-term equivalent level)
    
Retrieve all markers:

    marker = session.markers.first
    marker.id
    marker.name
    marker.time
    
Retrieve all audio file references:

    audio_pool = session.audio_pool
    audio_pool.path
    audio_pool.location
    
    file = audio_pool.files.first
    file.id
    file.name
    file.duration
    file.channels
    file.leq # (long-term equivalent level)
    file.dyn
    file.original_path # original file path
    
Add a new track:

    new_track = Hindbaer::Track.new do |t|
      t.name = 'Foo'
      t.pan = '-1'
    end
    session.tracks << new_track
    session.to_xml
    
License
-------

Copyright (c) 2011 Jamie Hodge

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.