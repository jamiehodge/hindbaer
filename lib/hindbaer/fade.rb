module Hindbaer
  class Fade
    
    ATTRIBUTES = %w{
      start length gain
      }
      
    attr_accessor *ATTRIBUTES
    
    def self.parse(doc)
      new do
        ATTRIBUTES.each do |attribute|
          self.send("#{attribute.to_sym}=", doc[attribute.capitalize])
        end
      end
    end
    
    def initialize(&block)
      block.arity > 0 ? block.call(self) : instance_eval(&block)
    end
    
    def to_xml(xml)
      xml.Fade Start: start, Length: length, Gain: gain
    end
    
  end
end