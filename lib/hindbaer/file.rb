module Hindbaer
  class File
    
    ATTRIBUTES = %w{
      id name duration
      channels leq dyn
      }
      
    attr_accessor *ATTRIBUTES
    attr_accessor :original_path
    
    def self.parse(doc)
      new do
        ATTRIBUTES.each do |attribute|
          self.send("#{attribute.to_sym}=", doc[attribute.capitalize])
        end
        
        self.original_path = doc.at_css('MetaData')['OriginalPath'] if 
          doc.at_css('MetaData')
      end
    end
    
    def initialize(&block)
      instance_eval(&block) if block_given?
    end
    
  end
end