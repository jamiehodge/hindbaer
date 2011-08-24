module Hindbaer
  
  class Session
    def initialize(file)
      File.open(file, 'r') do |file|
        @doc = Nokogiri::XML(file)
      end
    end
    
    def software_version
      @doc.at_css('Session')['Version']
    end
    
    def sample_rate
      @doc.at_css('Session')['Samplerate']
    end
    
    def name
      info['Name']
    end
    
    def title
      info['Title']
    end
    
    def subtitle
      info['Subtitle']
    end
    
    def author
      info['Author']
    end
    
    def description
      info['Description']
    end
    
    def album
      info['Album']
    end
    
    def album_track
      info['Track']
    end
    
    def keywords
      info['Keywords'].split(',').map { |k| k.strip }
    end
    
    def audio_pool
      @doc.css('AudioPool File').map { |f| Hindbaer::Audio.new(f.unlink) }
    end
    
    def audio_pool_path
      @doc.at_css('AudioPool')['Path']
    end
    
    def audio_pool_location
      @doc.at_css('AudioPool')['Location']
    end
    
    def tracks
      @doc.css('Tracks Track').map { |t| Hindbaer::Track.new(t.unlink, self) }
    end
    
    def markers
      @doc.css('Markers Marker').map { |m| Hindbaer::Marker.new(m.unlink) }
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
    
    private
    
      def info
        @doc.at_css('Info')
      end

  end
end