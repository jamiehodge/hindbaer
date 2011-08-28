module Hindbaer
  class Track
    
    attr_accessor :name, :pan, :regions, :plugins
    
    def self.parse(fragment)
      new do
        self.name = fragment['Name']
        self.pan  = fragment['Pan']
        
        self.regions = fragment.css('Region').map do |r|
          Hindbaer::Region.parse(r)
        end
        self.plugins = fragment.css('Plugin').map do |p|
          Hindbaer::Plugin.parse(p)
        end
      end
    end
    
    def initialize(&block)
      self.regions = []
      self.plugins = []
      
      instance_eval(&block) if block_given?
    end
  end
end