module Hindbaer
  class Group
    
    ATTRIBUTES = %w{
      caption used
    }

    attr_accessor *ATTRIBUTES
    attr_accessor :clips

    def self.parse(fragment)
      new do
        ATTRIBUTES.each do |attribute|
          self.send(
            "#{attribute.to_sym}=",   
            fragment[attribute.split('_').map(&:capitalize).join]
          )
        end
        
        self.clips = fragment.css('Clip').map { |c| Hindbaer::Clip.parse(c) }
      end
    end
    
    def initialize(&block)
      self.clips = []
      
      block.arity > 0 ? block.call(self) : instance_eval(&block)
    end
    
    def to_xml(xml)
      xml.Group Caption: caption, Used: used do
        clips.each do |clip|
          clip.to_xml(xml)
        end
      end
    end
    
  end
end