Hindbær
=======

A [Hindenburg Journalist](http://hindenburgsystems.com/) client for parsing, 
modifying and generating audio session files.

Installation
------------

    gem install hindbaer
    
Usage
-----

Parse a session file:

    project = Hindbaer::Session.new('spec/fixtures/project.nhsx')
    project.software_version
    project.sample_rate
    project.title
    project.subtitle
    project.description
    project.author
    project.album
    project.album_track
    project.keywords
    project.length # in seconds
    
Retrieve all tracks:

    tracks = project.tracks
    track = tracks.first
    track.name
    track.panning
    
Retrieve all regions for a given track:

    regions = tracks.first.regions
    region = region.first
    region.reference # audio file reference
    region.name
    region.start_time
    region.length
    region.offset
    region.fade_in
    region.fade_out
    region.gain
    region.leq # (long-term equivalent level)
    
Retrieve all fades for a given region:

    fades = regions.first.fades
    fade = fades.first
    fade.start_time
    fade.length
    fade.gain
    
Retrieve all markers:

    markers = project.markers
    marker = markers.first
    marker.id
    marker.name
    marker.time
    
Retrieve all audio file references:

    audio_pool = project.audio_pool
    file = audio_pool.first
    file.id
    file.name
    file.duration
    file.num_channels
    file.leq # (long-term equivalent level)
    file.dynamics
    file.original_path # original file path
    
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