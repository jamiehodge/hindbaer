module Hindbaer
  class Fade
    
    def initialize(fragment)
      @doc = fragment
    end
    
    def start_time
      @doc['Start']
    end
    
    def length
      @doc['Length']
    end
    
    def gain
      @doc['Gain']
    end
    
  end
end