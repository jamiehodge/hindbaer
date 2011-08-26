require_relative 'plugin/base'
require_relative 'plugin/equalizer'
require_relative 'plugin/compressor'
require_relative 'plugin/voice_profiler'

module Hindbaer
  module Plugin
    extend self
    
    def create(fragment)
      case fragment['UID']
      when 'nheq'
        Hindbaer::Plugin::Equalizer.new(fragment)
      when 'nhcl'
        Hindbaer::Plugin::Compressor.new(fragment)
      when 'nhlu'
        Hindbaer::Plugin::Base.new(fragment)
      when 'nhft'
        Hindbaer::Plugin::VoiceProfiler.new(fragment)
      end
    end
    
  end
  
end

