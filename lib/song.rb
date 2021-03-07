require 'pry'

class Song
    extend Concerns::Findable
attr_accessor :name, :artist, :genre
#  attr_reader :artist

@@all = []

    def initialize(name, artist = nil, genre = nil)
      # binding.pry
        @name = name
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil
        self.save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self 
    end

    def self.create(name)
        song = self.new(name)
        song.name = name
        song
    end

    def artist=(artist)
        #binding.pry
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        #binding.pry
        @genre = genre
        genre.add_song(self)
    end

 

  

end