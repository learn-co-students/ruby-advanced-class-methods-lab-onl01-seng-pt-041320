require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end
  
    

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  #takes in a string as an argument. This song name is set with song.new. self.new instantiates a new song. when we return song as our last return, it has been instatiated with a name.
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  #create_by_name uses the method funcitonality previously made to instantiate an object. The same method is used to set the song_name by using the .name method. The return is a the song instantiated using new_by_name and named using .name.
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name 
    song
  end
   
   #the string name of a song returns a matching instance of the song based on the objects name. Iterating through the @@all array, we detect each song and see if its name (.name, or the instances name) is equal to the argument song_name. If true, it will return that instance that makes it true.
   
   def self.find_by_name(song_name)
      @@all.detect{|s| s.name == song_name}
   end
  
  #taking in a string argument, we do one method OR the other. If find_by_name returns nil, that side will return as false and the method will execute the other side.
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  #using sort_by, .alphabetical sorts through the @@all array and sorts each song by song.name, which gives each instance of a song its specific name.
  
  def self.alphabetical
    @@all.sort_by do |song| 
    song.name
    end
  end 
  
  #input string with artist_name and song_name
  #output instance of song with song_name set to .name, and artist_name set to .artist_name with the filename removed
  
  def self.new_from_filename(filename) 
    split_filename = filename.slice(0, filename.length-4).split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end 
  
  def self.create_from_filename(filename)
    split_filename = filename.slice(0, filename.length-4).split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end 
  
  def self.destroy_all
    self.all.clear
    #@@all = []
    #@@all.clear
  end 
    
    
    



  

    
end
