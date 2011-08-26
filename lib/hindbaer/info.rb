module Hindbaer
  class Info
    
    def initialize(fragment)
      @doc = fragment
    end
    
    def name
      @doc['Name']
    end
    
    def title
      @doc['Title']
    end
    
    def subtitle
      @doc['Subtitle']
    end
    
    def author
      @doc['Author']
    end
    
    def link
      @doc['Link']
    end
    
    def email
      @doc['Email']
    end
    
    def description
      @doc['Description']
    end
    
    def album
      @doc['Album']
    end
    
    def album_track
      @doc['Track']
    end
    
    def artist
      @doc['Artist']
    end
    
    def composer
      @doc['Composer']
    end
    
    def date
      @doc['Date']
    end
    
    def genre
      @doc['Genre']
    end
    
    def copyright
      @doc['Copyright']
    end
    
    def explicit?
      @doc['Explicit'] == 'Yes'
    end
    
    def keywords
      @doc['Keywords'].split(',').map { |k| k.strip }
    end
    
    def identifier
      @doc['Identifier']
    end
    
    def reference
      @doc['Reference']
    end
    
  end
end