module Hindbaer
  module Plugin
    class Base
      
      def initialize(fragment)
        @doc = fragment
      end

      def id
        @doc['Id'].to_i
      end

      def name
        @doc['Name']
      end

      def uid
        @doc['UID']
      end
      
    end
  end
end