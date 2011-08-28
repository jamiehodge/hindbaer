module Hindbaer
  class Group
    
    attr_accessor :caption, :num_clips_used, :clips
    
    def self.parse(fragment)
      new do
        self.caption = fragment['Caption']
        self.num_clips_used  = fragment['Used']
        
        self.clips = fragment.css('Clip').map do |c|
          Hindbaer::Clip.parse(c)
        end
      end
    end
    
    def initialize(&block)
      self.clips = []
      
      instance_eval(&block) if block_given?
    end
    
  end
end