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
      self.all << Song.new 
      self.all.last 
  end 
  
  def self.new_by_name(song_title)
      song = Song.new
      song.name = song_title
      song 
  end 
  
  def self.create_by_name(song)
      new_song = Song.create
      new_song.name= song 
      new_song
  end 
  
  def self.find_by_name(song_name)
      self.all.find{|songs| songs.name == song_name}
  end 
  
  def self.find_or_create_by_name(name)
      find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end 
  
  def self.alphabetical
      self.all.sort_by{ |songs| songs.name.downcase }
  end 
  
  def self.new_from_filename(filename)
      file = filename.split(" - ")
      new_song = new_by_name(file[1].chomp(".mp3"))
      new_song.artist_name = file[0]
      new_song
  end 
  
  def self.create_from_filename(filename)
      file = filename.split(" - ")
      new_song = create_by_name(file[1].chomp(".mp3"))
      new_song.artist_name = file[0]
      new_song
  end 
    
  def self.destroy_all
      self.all.clear
  end 
end
