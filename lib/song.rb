class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) == nil ? Song.create_by_name(name) : Song.find_by_name(name)
  end

  def self.alphabetical
    alpha = self.all.sort_by {|song| song.name}
    alpha
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp (".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
