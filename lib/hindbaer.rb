require 'bundler/setup'

require 'nokogiri'

require 'hindbaer/version'
require 'hindbaer/session'
require 'hindbaer/info'
require 'hindbaer/audio_pool'
require 'hindbaer/file'
require 'hindbaer/track'
require 'hindbaer/region'
require 'hindbaer/fade'
require 'hindbaer/plugin'
require 'hindbaer/group'
require 'hindbaer/clip'
require 'hindbaer/marker'

module Hindbaer
  extend self
  
  def tc_to_secs(timecode)
    seconds, minutes, hours = timecode.split(':').reverse
    total = seconds.to_f if seconds
    total += minutes.to_f * 60 if minutes
    total += hours.to_f * 60 * 60 if hours
    total
  end
  
end