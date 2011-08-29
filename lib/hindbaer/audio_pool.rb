module Hindbaer
  class AudioPool
    
    ATTRIBUTES = %w{
      path location
      }
      
    attr_accessor *ATTRIBUTES
    attr_accessor :files
    
    def self.parse(doc)
      new do
        ATTRIBUTES.each do |attribute|
          self.send("#{attribute.to_sym}=", doc[attribute.capitalize])
        end
        
        self.files = doc.css('File').map do |f|
          Hindbaer::File.parse(f)
        end
      end
    end
    
    def initialize(&block)
      self.files = []
      
      instance_eval(&block) if block_given?
    end
    
  end
end