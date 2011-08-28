require_relative 'plugin/base'
require_relative 'plugin/equalizer'
require_relative 'plugin/compressor'
require_relative 'plugin/voice_profiler'

module Hindbaer
  module Plugin
    extend self
    
    def parse(fragment)
      case fragment['UID']
      when 'nheq'
        Hindbaer::Plugin::Equalizer.parse(fragment)
      when 'nhcl'
        Hindbaer::Plugin::Compressor.parse(fragment)
      when 'nhlu'
        Hindbaer::Plugin::Base.parse(fragment)
      when 'nhft'
        Hindbaer::Plugin::VoiceProfiler.parse(fragment)
      end
    end
    
  end
  
end

