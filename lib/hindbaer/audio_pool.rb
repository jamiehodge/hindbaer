module Hindbaer
  class AudioPool
    
    attr_accessor :path, :location, :files
    
    def self.parse(fragment)
      new do
        self.path = fragment['Path']
        self.location = fragment['Location']
        
        self.files = fragment.css('File').map do |f|
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