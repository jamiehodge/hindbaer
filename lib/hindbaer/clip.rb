module Hindbaer
  class Clip
    
    ATTRIBUTES = %w{
      ref name length leq
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
      xml.Clip Ref: ref, Name: name, Length: length, Leq: leq
    end
    
  end
end