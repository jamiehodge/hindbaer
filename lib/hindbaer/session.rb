module Hindbaer
  
  class Session
    def initialize(file)
      ::File.open(file, 'r') do |file|
        @doc = Nokogiri::XML(file)
      end
    end
    
    def software_version
      @doc.at_css('Session')['Version']
    end
    
    def sample_rate
      @doc.at_css('Session')['Samplerate']
    end
    
    def info
      Hindbaer::Info.new(@doc.at_css('Info').dup.unlink)
    end
    
    def audio_pool
      Hindbaer::AudioPool.new(@doc.at_css('AudioPool').dup.unlink)
    end
    
    def tracks
      @doc.css('Tracks Track').map { |t| Hindbaer::Track.new(t.dup.unlink, self) }
    end
    
    def clipboard_groups
      @doc.css('Clipboard Group').map { |g| Hindbaer::Group.new(g.dup.unlink, self) }
    end
    
    def markers
      @doc.css('Markers Marker').map { |m| Hindbaer::Marker.new(m.dup.unlink) }
    end
    
    def length
      regions = tracks.map do |t| 
        t.regions.last
      end.compact
      
      regions.map do |r| 
        Hindbaer.tc_to_secs(r.start_time) + 
        Hindbaer.tc_to_secs(r.length)
      end.max
    end

  end
end