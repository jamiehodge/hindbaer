module Hindbaer
  class Track
    
    def initialize(fragment, session = nil)
      @doc = fragment
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
    
    def plugins
      @doc.css('Plugin').map { |p| Hindbaer::Plugin.create(p.dup.unlink) }
    end
  end
end