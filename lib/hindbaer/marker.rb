module Hindbaer
  class Marker
    
    attr_accessor :id, :name, :time
    
    def self.parse(fragment)
      new do
        self.id = fragment['Id']
        self.name  = fragment['Name']
        self.time = fragment['Time']
      end
    end
    
    def initialize(&block)
      instance_eval(&block) if block_given?
    end
    
  end
end