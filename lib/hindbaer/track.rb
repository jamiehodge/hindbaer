module Hindbaer
  class Track
    
    def initialize(node, session = nil)
      @doc = node
      @session = session
    end
    
    attr_reader :session
    
    def name
      @doc['Name']
    end
    
    def pan
      @doc['Pan']
    end
    
    def regions
      @doc.css('Region').map { |r| Hindbaer::Region.new(r.dup.unlink, self) }
    end
  end
end