module Hindbaer
  class Info
    
    ATTRIBUTES = %w{
      name title subtitle author link email
      description album track artist composer
      date genre copyright explicit keywords
      identifier reference
      }
      
    attr_accessor *ATTRIBUTES
    
    def self.parse(fragment)
      new do
        ATTRIBUTES.each do |attribute|
          self.send("#{attribute.to_sym}=", fragment[attribute.capitalize])
        end
        
        self.keywords = keywords.split(',').map &:strip
      end
    end
    
    def initialize(&block)
      self.keywords = []
      
      block.arity > 0 ? block.call(self) : instance_eval(&block)
    end
    
  end
end