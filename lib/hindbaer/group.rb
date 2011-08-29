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
      
      instance_eval(&block) if block_given?
    end
    
  end
end