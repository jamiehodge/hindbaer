module Hindbaer
  class Session
    
    ATTRIBUTES = %w{
      version samplerate
      }
      
    attr_accessor *ATTRIBUTES
    attr_accessor :info, :audio_pool, :tracks, :clipboard_groups, :markers
    
    def self.parse(xml)
      doc = Nokogiri::XML(xml)
      
      new do
        ATTRIBUTES.each do |attribute|
          self.send("#{attribute.to_sym}=",
           doc.at_css('Session')[attribute.capitalize])
        end
        
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
      
      block.arity > 0 ? block.call(self) : instance_eval(&block)
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
        xml.Session Version: version, Samplerate: samplerate do
          info.to_xml(xml)
          audio_pool.to_xml(xml)
          xml.Tracks do
            tracks.each do |track|
              track.to_xml(xml)
            end
          end
          xml.Clipboard do
            clipboard_groups.each do |group|
              group.to_xml(xml)
            end
          end
          xml.Markers do
            markers.each do |marker|
              marker.to_xml(xml)
            end
          end
        end
      end.to_xml
    end

  end
end