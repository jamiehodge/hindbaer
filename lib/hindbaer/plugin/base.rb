module Hindbaer
  module Plugin
    class Base
      
      attr_accessor :id, :name, :uid, :bypass
      
      def self.parse(fragment)
        new do
          self.id = fragment['Id']
          self.name = fragment['Name']
          self.uid = fragment['UID']
          self.bypass = fragment['Bypass']
        end
      end
      
      def initialize(&block)        
        instance_eval(&block) if block_given?
      end
      
    end
  end
end