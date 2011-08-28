module Hindbaer
  module Plugin
    class VoiceProfiler < Hindbaer::Plugin::Base

      attr_accessor :comp
      attr_accessor :low_freq_freq, :low_freq_gain, :low_freq_q
      attr_accessor :mid_freq_freq, :mid_freq_gain, :mid_freq_q
      attr_accessor :high_freq_freq, :high_freq_gain, :high_freq_q
      attr_accessor :high_pass_freq, :high_pass_gain

      def self.parse(fragment)
        plugin = super(fragment)
        
        plugin.comp = fragment['Comp']
        
        plugin.low_freq_freq = fragment['LF_Freq']
        plugin.low_freq_gain = fragment['LF_Gain']
        plugin.low_freq_q    = fragment['LF_Q']
        
        plugin.mid_freq_freq = fragment['MF_Freq']
        plugin.mid_freq_gain = fragment['MF_Gain']
        plugin.mid_freq_q    = fragment['MF_Q']
        
        plugin.high_freq_freq = fragment['HF_Freq']
        plugin.high_freq_gain = fragment['HF_Gain']
        plugin.high_freq_q    = fragment['HF_Q']

        plugin.high_pass_freq = fragment['HP_Freq']
        plugin.high_pass_gain = fragment['HP_Gain']
        
        plugin
      end

    end
  end
end