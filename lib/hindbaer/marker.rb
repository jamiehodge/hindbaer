module Hindbaer
  class Marker
    
    ATTRIBUTES = %w{
      id name time
    }

    attr_accessor *ATTRIBUTES

    def self.parse(fragment)
      new do
        ATTRIBUTES.each do |attribute|
          self.send(
            "#{attribute.to_sym}=",   
            fragment[attribute.split('_').map(&:capitalize).join]
          )
        end
      end
    end
    
    def initialize(&block)
      instance_eval(&block) if block_given?
    end
    
  end
end