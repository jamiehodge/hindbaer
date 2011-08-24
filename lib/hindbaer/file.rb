module Hindbaer
  class File
    def initialize(fragment)
      @doc = fragment
    end
    
    def id
      @doc['Id'].to_i
    end
    
    def name
      @doc['Name']
    end
    
    def duration
      @doc['Duration']
    end
    
    def num_channels
      @doc['Channels'].to_i
    end
    
    def leq
      @doc['Leq'].to_f || 0
    end
    
    def dynamics
      @doc['Dyn'].to_f || 0
    end
    
    def original_path
      return unless md = @doc.at_css('MetaData')
      md['OriginalPath']
    end
  end
end