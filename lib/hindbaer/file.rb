module Hindbaer
  class File
    
    ATTRIBUTES = %w{
      id name duration
      channels leq dyn
      }
      
    attr_accessor *ATTRIBUTES
    attr_accessor :original_path
    
    def self.parse(fragment)
      new do
        ATTRIBUTES.each do |attribute|
          self.send("#{attribute.to_sym}=", fragment[attribute.capitalize])
        end
        
        if fragment.at_css('MetaData')
          self.original_path = fragment.at_css('MetaData')['OriginalPath']
        end
      end
    end
    
    def initialize(&block)
      instance_eval(&block) if block_given?
    end
    
  end
end