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
    binding.pry
    # can find a song present in @@all by name   
    @@all.each do |song|
      
    end
  end

end
