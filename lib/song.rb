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
    name_artist[0] = Artist.new(name_artist[0])
    name_artist[1] = self.new(name_artist[1])
    song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name
    song
  end
end