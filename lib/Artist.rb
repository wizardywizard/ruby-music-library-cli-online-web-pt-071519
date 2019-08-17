require 'pry'
class Artist
  
  extend Concerns::Findable
  
 attr_accessor  :name
  
 @@all = [] 
  
  def initialize(name)
    @name = name
    @songs = []
    save
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
  
  def songs 
    @songs
  end
  
  def genres 
     genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
  
  def self.create(name)
    Artist.new(name)
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end
  
end
