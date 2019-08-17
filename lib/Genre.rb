class Genre 
  
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
  
  def self.create(name)
    Genre.new(name)
  end
  
  def songs 
    @songs
  end
  
  def artists
    artists = @songs.collect do |song|
      song.artist 
    end
    artists.uniq
  end
  
end