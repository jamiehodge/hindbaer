module Hindbaer
  module Plugin
    class Equalizer < Hindbaer::Plugin::Base
      
      attr_accessor :low_freq_freq, :low_freq_gain, :low_freq_q
      attr_accessor :mid_freq_freq, :mid_freq_gain, :mid_freq_q
      attr_accessor :high_freq_freq, :high_freq_gain, :high_freq_q
      attr_accessor :low_freq_type, :high_freq_type

      
      def self.parse(fragment)
        plugin = super(fragment)
        
        plugin.low_freq_freq = fragment['LF_Freq']
        plugin.low_freq_gain = fragment['LF_Gain']
        plugin.low_freq_q    = fragment['LF_Q']
        plugin.low_freq_type = fragment['LF_Type']
        
        plugin.mid_freq_freq = fragment['MF_Freq']
        plugin.mid_freq_gain = fragment['MF_Gain']
        plugin.mid_freq_q    = fragment['MF_Q']
        
        plugin.high_freq_freq = fragment['HF_Freq']
        plugin.high_freq_gain = fragment['HF_Gain']
        plugin.high_freq_q    = fragment['HF_Q']
        plugin.high_freq_type = fragment['HF_Type']
        
        plugin
      end
      
    end
  end
end