class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name_string)
    song = self.new
    song.name = name_string
    song
  end

  def self.create_by_name(name_string)
    song = self.new
    song.name = name_string
    song.save
    song
  end

def self.find_by_name(name_string)
  self.all.find {|song| song.name == name_string}
end

def self.find_or_create_by_name(name_string)
  self.find_by_name(name_string) || self.create_by_name(name_string)
end

def self.alphabetical
  self.all.sort_by {|song| song.name}
end

def self.new_from_filename(filename)
  array = filename.split(" - ")
 array[1] = array[1].chomp(".mp3")
    song = self.new
    song.name = array[1]
    song.artist_name = array[0] 
    song
  end

def self.create_from_filename(filename)
array = filename.split(" - ")
 array[1] = array[1].chomp(".mp3")
    song = self.new
    song.name = array[1]
    song.artist_name = array[0]
    song.save 
    song
end

def self.destroy_all
  self.all.clear
end
end