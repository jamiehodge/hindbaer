module Hindbaer
  module Plugin
    class Compressor < Hindbaer::Plugin::Base

      def uid
        'nhcl'
      end

      def name
        'Compressor'
      end

      def comp
        @doc['Comp']
      end
      
    end
  end
end