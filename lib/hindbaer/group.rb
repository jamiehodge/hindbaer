module Hindbaer
  class Group
    
    def initialize(fragment, session)
      @doc = fragment
      @session = session
    end
    
    attr_reader :session
    
    def caption
      @doc['Caption']
    end
    
    def num_clips_used
      @doc['Used'].to_i
    end
    
    def clips
      @doc.css('Clip').map { |c| Hindbaer::Clip.new(c.dup.unlink, self) }
    end
    
  end
end