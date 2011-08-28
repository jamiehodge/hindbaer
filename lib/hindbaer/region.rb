module Hindbaer
  class Region
    
    ATTRIBUTES = %w{
      ref name start offset length fade_in fade_out gain leq dynamics
    }
      
    attr_accessor *ATTRIBUTES
    attr_accessor :fades
    
    def self.parse(fragment)
      new do
        ATTRIBUTES.each do |attribute|
          self.send(
          "#{attribute.to_sym}=",   
          fragment[attribute.split('_').map(&:capitalize).join]
          )
          
          self.start = '00.0' unless start
          
          self.fades = fragment.css('Fade').map do |f|
            Hindbaer::Fade.parse(f)
          end
        end
      end
    end
    
    def initialize(&block)
      self.fades = []
      
      instance_eval(&block) if block_given?
    end
    
  end
end