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
      @doc.css('AudioPool File').map { |f| Hindbaer::Audio.new(f.dup.unlink) }
    end
    
    def audio_pool_path
      @doc.at_css('AudioPool')['Path']
    end
    
    def audio_pool_location
      @doc.at_css('AudioPool')['Location']
    end
    
    def tracks
      @doc.css('Tracks Track').map { |t| Hindbaer::Track.new(t.dup.unlink, self) }
    end
    
    def markers
      @doc.css('Markers Marker').map { |m| Hindbaer::Marker.new(m.dup.unlink) }
    end
    
    def length
      regions = tracks.map do |t| 
        t.regions.last
      end.compact
      
      regions.map do |r| 
        tc_to_secs(r.start_time) + 
        tc_to_secs(r.length)
      end.max
    end
    
    private
    
      def info
        @doc.at_css('Info')
      end
      
      def tc_to_secs(timecode)
        seconds, minutes, hours = timecode.split(':').reverse
        total = seconds.to_f if seconds
        total += minutes.to_f * 60 if minutes
        total += hours.to_f * 60 * 60 if hours
        total
      end

  end
end