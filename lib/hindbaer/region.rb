module Hindbaer
  class Region
    def initialize(fragment, track = nil)
      @doc = fragment
      @track = track
    end
    
    attr_reader :track
    
    def reference
      id = @doc['Ref'].to_i
      self.track.session.audio_pool.files.find { |a| a.id == id }
    end
    
    def name
      @doc['Name']
    end
    
    def start_time
      @doc['Start'] || '00.0'
    end
    
    def length
      @doc['Length']
    end
    
    def relative_length
      length / track.session.length
    end
    
    def offset
      @doc['Offset'] || '00:00'
    end
    
    def fade_in
      @doc['FadeIn']|| '00.0'
    end
    
    def fade_out
      @doc['FadeOut'] || '00.0'
    end
    
    def gain
      @doc['Gain'].to_f || 0.0
    end
    
    def leq
      @doc['Leq'].to_f || 0.0
    end
    
    def dynamics
      @doc['Dyn'].to_f || 0.0
    end
    
    def fades
      @doc.css('Fade').map { |f| Hindbaer::Fade.new(f.dup.unlink) }
    end
  end
end