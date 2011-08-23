module Hindbaer
  class Marker
    def initialize(fragment)
      @doc = fragment
    end
    
    def id
      @doc['Id'].to_i
    end
    
    def name
      @doc['Name']
    end
    
    def time
      @doc['Time']
    end
  end
end