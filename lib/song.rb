class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
def self.create 
  new_song = self.new  #initialize a song and save it to the @@all class variable
  @@all << new_song
  new_song
end 

def self.new_by_name(song_name) 
  new_song = self.new 
  new_song.name = song_name 
  new_song
end 

def self.create_by_name(song_name) 
  new_song = self.new 
  new_song.name = song_name
  @@all << new_song
  new_song
end 

def self.find_by_name (name)
  @@all.find{|song| song.name == name}
end

def self.find_or_create_by_name(name)
  song = self.find_by_name(name)
  if song  #accept string name for a song to return a matching song instance
    return song 
  else 
     self.create_by_name(name) 
 end 
end

def self.alphabetical 
  self.all.sort_by{|song|song.name}
end  

def self.new_from_filename(filename)
  song = self.new 
  song_array = filename.split(" - ")
  song_array[1] = song_array[1].chomp(".mp3")
  song.artist_name = song_array[0]
  song.name = song_array[1]
  song
end  

def self.create_from_filename(filename)
  song = self.create
  equal = self.new_from_filename(filename)
  song.artist_name = equal.artist_name
  song.name = equal.name 
  song
end 

def self.destroy_all 
  self.all.clear 
 end 
end
