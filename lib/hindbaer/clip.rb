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
      instance_eval(&block) if block_given?
    end
    
  end
end