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
  
  def self.find_or_create_by_name(new_name)
    song_f = self.find_by_name(new_name)
    if song_f != nil 
      song_f
    else
      self.create_by_name(new_name)
    end
  end
  
  def self.create
    new_song = Song.new
    new_song.save 
    return new_song
  end
  
  def self.new_by_name(new_name)
    new_song = Song.new
    new_song.name = new_name 
    return new_song
  end
  
  def self.find_by_name(new_name) 
    @@all.find do |song|
      song.name == new_name
    end
  end
  
  def self.create_by_name(new_name)
    new_song = Song.new
    new_song.name = new_name
    new_song.save
    return new_song
  end
  
  def self.alphabetical
    @@all.sort_by{ |i| i.name}
  end 
  
  def self.new_from_filename(file)
    title = file.split(" - ")
    artist_name = title[0]
    new_name = title[1].gsub(".mp3","")
    
    new_song = Song.new 
    new_song.name = new_name
    new_song.artist_name = artist_name
    return new_song
  end
  
  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
  end 
  
  def self.destroy_all
    @@all.clear
  end 

end
