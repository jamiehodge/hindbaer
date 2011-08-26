module Hindbaer
  module Plugin
    class Equalizer < Hindbaer::Plugin::Base

      def uid
        'nheq'
      end

      def name
        'Equalizer'
      end

      def bypass
        @doc['Bypass']
      end

      def low_freq_freq
        @doc['LF_Freq']
      end

      def low_freq_gain
        @doc['LF_Gain']      
      end

      def low_freq_q
        @doc['LF_Q']
      end

      def low_freq_type
        @doc['LF_Type']
      end

      def mid_freq_freq
        @doc['MF_Freq']
      end

      def mid_freq_gain
        @doc['MF_Gain']
      end

      def mid_freq_q
        @doc['MF_Q']
      end

      def high_freq_freq
        @doc['HF_Freq']
      end

      def high_freq_gain
        @doc['HF_Gain']
      end

      def high_freq_q
        @doc['HF_Q']
      end

      def high_freq_type
        @doc['HF_Type']
      end
      
    end
  end
end