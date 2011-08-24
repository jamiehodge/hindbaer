module Hindbaer
  class AudioPool
    
    def initialize(fragment)
      @doc = fragment
    end
    
    def path
      @doc['Path']
    end
    
    def location
      @doc['Location']
    end
    
    def files
      @doc.css('File').map { |f| Hindbaer::File.new(f.dup.unlink) }
    end
    
  end
end