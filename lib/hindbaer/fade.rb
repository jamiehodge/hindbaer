module Hindbaer
  class Fade
    
    attr_accessor :start, :length, :gain
    
    def self.parse(fragment)
      new do
        self.start = fragment['Start']
        self.length = fragment['Length']
        self.gain = fragment['Gain']
      end
    end
    
    def initialize(&block)
      instance_eval(&block) if block_given?
    end
    
  end
end