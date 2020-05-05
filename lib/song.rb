require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

 def self.create
  song = self.new
  @@all << song
  song
 end

 def self.new_by_name(name)
  song = self.new
  song.name= name
  song
 end


def self.create_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  song
end

def self.find_by_name(name)
  @@all.find do |song|
    song.name == name
  end
  end

def self.find_or_create_by_name(name)
self.find_by_name(name) || self.create_by_name(name)
end

def self.alphabetical
  @@all.sort_by! do |song|
    song.name
  end
  end


def self.new_from_filename(name)
 # binding.pry
  split_name = name.split(".")
  name_artist = split_name[0].split(" - ")
  song = self.new_by_name(name_artist[1])
  song.artist_name=(name_artist[0])
  song
end

def self.create_from_filename(name)
  formatted = self.format_filename(name)
  song = self.create_by_name(formatted[:name])
  song.artist_name=(formatted[:artist_name])
  song
end

def self.destroy_all
  @@all.clear
  @@all
end



  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



  private
  def self.format_filename(filename)
    
    split_name = filename.split(".")
    name_artist = split_name[0].split(" - ")
    {name: name_artist[1], artist_name: name_artist[0]}
  end

end
