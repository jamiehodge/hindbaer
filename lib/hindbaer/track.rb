module Hindbaer
  class Track
    
    ATTRIBUTES = %w{
      name pan
      }
      
    attr_accessor *ATTRIBUTES
    attr_accessor :regions, :plugins
    
    def self.parse(doc)
      new do
        ATTRIBUTES.each do |attribute|
          self.send("#{attribute.to_sym}=", doc[attribute.capitalize])
        end
        
        self.regions = doc.css('Region').map do |r|
          Hindbaer::Region.parse(r)
        end
        self.plugins = doc.css('Plugin').map do |p|
          Hindbaer::Plugin.parse(p)
        end
      end
    end
    
    def initialize(&block)
      self.regions = []
      self.plugins = []
      
      block.arity > 0 ? block.call(self) : instance_eval(&block)
    end
  end
end