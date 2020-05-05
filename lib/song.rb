require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
    #binding.pry
  end
  
  def self.create_by_name(name)
    # song = self.new
    # @@all << song
    song = self.create
    song.name = name
    song
    #binding.pry
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    
    # found = self.find_by_name(name)
    
    # if found 
    #   found
    # else
    #   self.create_by_name(name)
    # end
    # #binding.pry
  end
  
  def self.alphabetical
    #self.all.sort_by{|song| song.name}
    self.all.sort_by(&:name)
  end
  
  def self.new_from_filename(filename)
    new_song = self.new
    string_array = filename.split(/ - |\./)
    #new_song = filename.chomp(".mp3").split(" - ")
    new_song.artist_name = string_array[0]
    new_song.name = string_array[1]
    new_song

    #binding.pry
    
    # new_song = self.new
    # string_array = []
    # string_array = string.split(".")
    # name_song_string = string_array.first
    # another_string_array = []
    # another_string_array = name_song_string.split(" - ")
    # new_song.artist_name = another_string_array[0]
    # new_song.name = another_string_array[1]
    # new_song
  end

  def self.create_from_filename(filename)
    new_file = self.new_from_filename(filename)
    @@all << new_file
    
    #binding.pry
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
