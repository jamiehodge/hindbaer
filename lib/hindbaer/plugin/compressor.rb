module Hindbaer
  module Plugin
    class Compressor < Hindbaer::Plugin::Base

      attr_accessor :comp
      
      def self.parse(fragment)
        plugin = super(fragment)
        
        plugin.comp = fragment['Comp']
        
        plugin
      end
      
      def to_xml(xml)
        xml.Plugin Id: id, Name: name, UID: uid, Bypass: bypass, Comp: comp
      end
      
    end
  end
end