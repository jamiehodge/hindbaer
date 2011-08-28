module Hindbaer
  class Session
    
    attr_accessor :version, :sample_rate
    attr_accessor :info, :audio_pool, :tracks, :clipboard_groups, :markers
    
    def self.parse(xml)
      doc = Nokogiri::XML(xml)
      
      new do
        self.version = doc.at_css('Session')['Version']
        self.sample_rate = doc.at_css('Session')['Samplerate']
        
        self.info = Hindbaer::Info.parse(doc.at_css('Info'))
        
        self.audio_pool = 
          Hindbaer::AudioPool.parse(doc.at_css('AudioPool'))
        
        self.tracks = doc.css('Tracks Track').map do |t|
          Hindbaer::Track.parse(t)
        end
        
        self.clipboard_groups = doc.css('Clipboard Group').map do |g|
          Hindbaer::Group.parse(g)
        end
        
        self.markers = doc.css('Markers Marker').map do |m|
          Hindbaer::Marker.parse(m)
        end
      end
    end
    
    def initialize(&block)
      self.info = {}
      self.audio_pool = {}
      self.tracks = []
      self.clipboard_groups = []
      self.markers = []
      
      instance_eval(&block) if block_given?
    end
    
    def length
      regions = tracks.map do |t| 
        t.regions.last
      end.compact
      
      regions.map do |r| 
        Hindbaer.tc_to_secs(r.start) + 
        Hindbaer.tc_to_secs(r.length)
      end.max
    end
    
    def to_xml
      Nokogiri::XML::Builder.new do |xml|
        xml.Session Version: version, Samplerate: sample_rate do
          xml.Info Subtitle: info.subtitle, Album: info.album, Composer: info.composer, Track: info.track, Genre: info.genre, Author: info.author, Link: info.link, Email: info.email, Description: info.description, Artist: info.artist, Date: info.date, Title: info.title, Explicit: info.explicit, Copyright: info.copyright, Identifier: info.identifier, Keywords: info.keywords.join(', '), Reference: info.reference
          xml.AudioPool Path: audio_pool.path, Location: audio_pool.location do
            audio_pool.files.each do |file|
              xml.File Id: file.id, Name: file.name, Duration: file.duration, Channels: file.channels, Leq: file.leq do
                xml.MetaData OriginalPath: file.original_path
              end
            end
          end
          xml.Tracks do
            tracks.each do |track|
              xml.Track Name: track.name, Pan: track.pan do
                track.regions.each do |region|
                  xml.Region Ref: region.ref, Name: region.name, Start: region.start, Length: region.length, Offset: region.offset, FadeIn: region.fade_in, FadeOut: region.fade_out, Gain: region.gain, Leq: region.leq do
                    region.fades.each do |fade|
                      xml.Fade Start: fade.start, Length: fade.length, Gain: fade.gain
                    end
                  end
                end
                unless track.plugins.empty?
                  xml.Plugins do
                    track.plugins.each do |plugin|
                      case plugin.uid
                      when 'nheq'
                        xml.Plugin Id: plugin.id, Name: plugin.name, UID: plugin.uid, Bypass: plugin.bypass, LF_Freq: plugin.low_freq_freq, LF_Gain: plugin.low_freq_gain, LF_Q: plugin.low_freq_q, LF_Type: plugin.low_freq_type, MF_Freq: plugin.mid_freq_freq, MF_Gain: plugin.mid_freq_gain, MF_Q: plugin.mid_freq_q, HF_Freq: plugin.high_freq_freq, HF_Gain: plugin.high_freq_gain, HF_Q: plugin.high_freq_q, HF_Type: plugin.high_freq_type
                      when 'nhcl'
                        xml.Plugin Id: plugin.id, Name: plugin.name, UID: plugin.uid, Bypass: plugin.bypass, Comp: plugin.comp
                      when 'nhlu'
                        xml.Plugin Id: plugin.id, Name: plugin.name, UID: plugin.uid, Bypass: plugin.bypass
                      when 'nhft'
                        xml.Plugin Id: plugin.id, Name: plugin.name, UID: plugin.uid, Bypass: plugin.bypass, LF_Freq: plugin.low_freq_freq, LF_Gain: plugin.low_freq_gain, LF_Q: plugin.low_freq_q, MF_Freq: plugin.mid_freq_freq, MF_Gain: plugin.mid_freq_gain, MF_Q: plugin.mid_freq_q, HF_Freq: plugin.high_freq_freq, HF_Gain: plugin.high_freq_gain, HF_Q: plugin.high_freq_q, HP_Freq: plugin.high_pass_freq, HP_Gain: plugin.high_pass_gain, Comp: plugin.comp
                      end
                    end
                  end
                end
              end
            end
          end
          xml.Clipboard do
            clipboard_groups.each do |group|
              xml.Group Caption: group.caption, Used: group.num_clips_used do
                group.clips.each do |clip|
                  xml.Clip Ref: clip.ref, Name: clip.name, Length: clip.length, Leq: clip.leq
                end
              end
            end
          end
          xml.Markers do
            markers.each do |marker|
              xml.Marker Id: marker.id, Name: marker.name, Time: marker.time
            end
          end
        end
      end.to_xml
    end

  end
end