require "pry"
class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(file)
    name_artist = file.split(/( - |.mp3)/)
    binding.pry
    name_artist[0] = self.new(name_artist[0])
    name_artist[0].artist = artist.new(name_artist[1])
    # name_artist[0] = Artist.new(name_artist[0])
    # name_artist[1] = self.new(name_artist[1])
    song
  end
  
  def artist_name=(name)
    self.artist = artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end