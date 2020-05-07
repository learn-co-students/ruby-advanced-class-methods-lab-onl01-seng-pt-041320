require 'pry'

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
    # instantiates
    song = self.new    
    # and saves the song,
    song.save
    # and it returns the new song that was created
    song
  end

  def self.new_by_name(name)
    # instantiates a song by new_by_name
    song = self.new()
    # with a name property
    song.name = name
    # and it returns the new song that was created
    song
  end

  def self.create_by_name(name)
    # instantiates by create_by_name
    song = self.create()
    # and saves a song with a name property
    song.name = name
    # and it returns the new song that was created
    song
  end

  def self.find_by_name(name)
    # can find a song present in @@all by name   
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # invokes .find_by_name and .create_by_name instead of repeating code 
    self.find_by_name(name) ||
    self.create_by_name(name)
    # returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    # initializes a song and artist_name based on the filename format
    new_file = name.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1]
    song = self.new 
    song.name = song_name
    artist = self.new
    artist.name = artist_name
    
    # binding.pry
  end
end
