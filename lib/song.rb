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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(new_song_name)
    new_song = self.new
    new_song.name = new_song_name
    new_song
  end

  def self.create_by_name(name_created)
    created_song = self.new
    created_song.name = name_created
    created_song.save
    created_song
  end

  def self.find_by_name(search)
    self.all.detect do |songs|
      songs.name == search
    end
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by do |s|
      s.name
    end
  end
# new instance method. recieve argument of (file_name)
    def self.new_from_filename(file_name)
      #uses the method .split to seperatate file_name whe dashes are located
    parts = file_name.split(" - ")
    #file name was seperated in to 2 string. part[0]and part[1]
    #part[0] is artist_name
    artist_name = parts[0]
    #part[1] is song_name

    song_name = parts[1].gsub(".mp3", "")
binding.pry
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end


#   .new_from_filename
#     initializes a song and artist_name based on the filename format (FAILED - 10)
#   .create_from_filename
#     initializes and saves a song and artist_name based on the filename format (FAILED - 11)
#   .destroy_all
#     clears all the song instances from the @@all array (FAILED - 12)
