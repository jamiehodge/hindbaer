module Hindbaer
  module Plugin
    class Base
      
      ATTRIBUTES = %w{
        id name bypass
      }

      attr_accessor *ATTRIBUTES, :uid

      def self.parse(fragment)
        new do
          ATTRIBUTES.each do |attribute|
            self.send(
              "#{attribute.to_sym}=",   
              fragment[attribute.split('_').map(&:capitalize).join]
            )
          end
          self.uid = fragment['UID']
        end
      end
      
      def initialize(&block)
        block.arity > 0 ? block.call(self) : instance_eval(&block)
      end
      
      def to_xml(xml)
        xml.Plugin Id: id, Name: name, UID: uid, Bypass: bypass
      end
      
    end
  end
end