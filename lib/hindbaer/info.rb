module Hindbaer
  class Info
    
    ATTRIBUTES = %w{
      name title subtitle author link email
      description album track artist composer
      date genre copyright explicit keywords
      identifier reference
      }
      
    attr_accessor *ATTRIBUTES
    
    def self.parse(fragment)
      new do
        ATTRIBUTES.each do |attribute|
          self.send("#{attribute.to_sym}=", fragment[attribute.capitalize])
        end
        
        self.keywords = keywords.split(',').map &:strip
      end
    end
    
    def initialize(&block)
      self.keywords = []
      
      block.arity > 0 ? block.call(self) : instance_eval(&block)
    end
    
    def to_xml(xml)
      xml.Info Subtitle: subtitle, Album: album, Composer: composer, Track: track, Genre: genre, Author: author, Link: link, Email: email, Description: description, Artist: artist, Date: date, Title: title, Explicit: explicit, Copyright: copyright, Identifier: identifier, Keywords: keywords.join(', '), Reference: reference
    end
    
  end
end