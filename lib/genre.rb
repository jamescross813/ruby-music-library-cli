require 'pry'

class Genre
    extend Concerns::Findable
attr_accessor :name, :songs

@@all = []

    def initialize(name)
        @name = name
        @songs = []
        self.save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
    
    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def add_song(song)
        # binding.pry
         if song.genre == nil
         song.genre = self
         end
         if !@songs.include?(song)
         @songs << song
         end
     end

     def artists
        @new_array = []
        @songs.each do |song|
          if @new_array.include?(song.artist)
            nil
          else
            @new_array << song.artist
          end
        end
        @new_array
      end

      
end