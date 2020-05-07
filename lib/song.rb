require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    c = self.new 
    c.save
    c
  end
 
  def self.new_by_name(song_name)
    c = self.new
    c.name = song_name
    c
  end
  
  def self.create_by_name(song_name)
    c = self.new
    c.name = song_name
    @@all << c
    c
  end
  
  def self.find_by_name(song_name)
    @@all.detect{|n| n.name == song_name}
   end
  
  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end
  
  def self.alphabetical
    @@all.sort_by {|songs| songs.name}
  end
  
  def self.new_from_filename(filename)
    filename = filename.split(/\ - |\.mp3/)
    c = self.new
    c.name = filename[1]
    c.artist_name = filename[0]
    c
  end

  def self.create_from_filename(filename)
    filename = filename.split(/\ - |\.mp3/)
    c = self.create
    c.name = filename[1]
    c.artist_name = filename[0]
    c
  end

  def self.destroy_all
    self.all.clear
  end
  
end  
