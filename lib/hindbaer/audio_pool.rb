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
      
      block.arity > 0 ? block.call(self) : instance_eval(&block)
    end
    
    def to_xml(xml)
      xml.AudioPool Path: path, Location: location do
        files.each do |file|
          file.to_xml(xml)
        end
      end
    end
    
  end
end