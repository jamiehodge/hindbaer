module Hindbaer
  class Clip
    
    def initialize(fragment, group)
      @doc = fragment
      @group = group
    end
    
    attr_reader :group
    
    def reference
      id = @doc['Ref'].to_i
      self.group.session.audio_pool.files.find { |a| a.id == id }
    end
    
    def name
      @doc['Name']
    end
    
    def length
      @doc['Length']
    end
    
    def leq
      return '-' if @doc['Leq'] == '-'
      @doc['Leq'].to_f
    end
  end
end