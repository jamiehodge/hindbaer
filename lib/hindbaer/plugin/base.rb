module Hindbaer
  module Plugin
    class Base
      
      ATTRIBUTES = %w{
        id name uid bypass
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
end