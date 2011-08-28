module Hindbaer
  class Clip
    
    attr_accessor :ref, :name, :length, :leq
    
    def self.parse(fragment)
      new do
        self.ref = fragment['Ref']
        self.name = fragment['Name']
        self.length = fragment['Length']
        self.leq = fragment['Leq']
      end
    end
    
    def initialize(&block)
      instance_eval(&block) if block_given?
    end
    
  end
end