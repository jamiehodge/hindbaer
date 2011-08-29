module Hindbaer
  class Track
    
    ATTRIBUTES = %w{
      name pan
      }
      
    attr_accessor *ATTRIBUTES
    attr_accessor :regions, :plugins
    
    def self.parse(doc)
      new do
        ATTRIBUTES.each do |attribute|
          self.send("#{attribute.to_sym}=", doc[attribute.capitalize])
        end
        
        self.regions = doc.css('Region').map do |r|
          Hindbaer::Region.parse(r)
        end
        self.plugins = doc.css('Plugin').map do |p|
          Hindbaer::Plugin.parse(p)
        end
      end
    end
    
    def initialize(&block)
      self.regions = []
      self.plugins = []
      
      block.arity > 0 ? block.call(self) : instance_eval(&block)
    end
    
    def to_xml(xml)
      xml.Track Name: name, Pan: pan do
        regions.each do |region|
          xml.Region Ref: region.ref, Name: region.name, Start: region.start, Length: region.length, Offset: region.offset, FadeIn: region.fade_in, FadeOut: region.fade_out, Gain: region.gain, Leq: region.leq do
            region.fades.each do |fade|
              fade.to_xml(xml)
            end
          end
        end
        unless plugins.empty?
          xml.Plugins do
            plugins.each do |plugin|
              plugin.to_xml(xml)
            end
          end
        end
      end
    end
  end
end