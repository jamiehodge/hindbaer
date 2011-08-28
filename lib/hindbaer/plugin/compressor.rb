module Hindbaer
  module Plugin
    class Compressor < Hindbaer::Plugin::Base

      attr_accessor :comp
      
      def self.parse(fragment)
        plugin = super(fragment)
        
        plugin.comp = fragment['Comp']
        
        plugin
      end
      
    end
  end
end