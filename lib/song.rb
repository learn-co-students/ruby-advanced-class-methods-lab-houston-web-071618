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
    song = Song.new
    song.save
    song
    #return song instance
  end

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |s|
      s.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
      # binding.pry
    end
    # binding.pry

  end

  def self.new_from_filename(file_name)
    parts = file_name.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
    # binding.pry
  end

  def self.create_from_filename(file_name)
    parts = file_name.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
    # binding.pry
  end

  def self.destroy_all
    @@all.clear
  end
end

# song = Song.create
# blank = Song.new_by_name("Blank Space")
# middle = Song.new_by_name("In The Middle")
#
# song_1 = Song.create_by_name("Thriller")
# song_2 = Song.create_by_name("Blank Space")
# song_3 = Song.create_by_name("Call Me Maybe")
#
# binding.pry
