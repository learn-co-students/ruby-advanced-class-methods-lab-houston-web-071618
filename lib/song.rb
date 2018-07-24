require "pry"

class Song

  attr_accessor :name, :artist_name

@@all = []

  def self.all
    @@all
  end

  # instance method
  # saving instance of self to class @@all
  def save
  #   if self.class.all == @@all
  #   # binding.pry
  #   puts true
  # else
  #   puts false
  # end
    @@all << self
    # binding.pry
  end

  # create is a class method, not an instance method because we want it to all of this in one method
  # create a new instance of the class Song
  # save the song into @@all class variable
  # and return the song instance
  def self.create
    # song is a new instance of the song
    # same as self.new
    song = Song.new
    # calls the instance method to save the song to the class variable @@all
    song.save
    # returns the song instance just created
    song
  end

  # creates an instance of a class Song but doesn't save it to @@all
  def self.new_by_name(name)
    # binding.pry
    # same as self.new
    song = Song.new
    # assign name to name property
    song.name = name
    song
  end

# takes in the string name of a song and returns a song instance with that name set as its name property and the song being saved into the @@all class variable
  def self.create_by_name(name)
    # song is saving here by virtue of create method which saves it to the @@all class variable
    # same as self.create
    song = Song.create
    # binding.pry
    # assign name to name property
    song.name = name
    song
  end
  # binding.pry

# accepts the string name of a song and returns the matching instance of the song with that name
  def self.find_by_name(name)
    self.all.find do |s|
      # binding.pry
      # s is an element in @@all class variable array
      # true or false, name of element in @@all is equal to name being passed
      s.name == name
    end
  end

# In order to prevent duplicate songs being created that actually represent the same song
  def self.find_or_create_by_name(name)
    # calls find by name method or create by name method
    # self.find_by_name(name) || self.create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    # returns array of song name sorted
    # name_array = self.all.map do |s|
    # s.name
    # end
    # name_array.sort

    # returns array of song instances sorted
    self.all.sort_by do |s| s.name end
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")
    artist_name = split_filename[0]
    song_name = split_filename[1].chomp(".mp3")
    # binding.pry
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    split_filename = filename.split(" - ")
    artist_name = split_filename[0]
    song_name = split_filename[1].chomp(".mp3")
    # binding.pry
    song = Song.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

# # comment out bc alphabetical won't work with nil
# # song = Song.create
#
# # not saved in @@all bc it doesn't call the save method
# song_4 = Song.new_by_name("Blank Space")
#
# song_1 = Song.create_by_name("Hello")
# song_2 = Song.create_by_name("The Middle")
#
# song_1_find = Song.find_by_name("Hello")
# # => returns song Hello
#
# # won't be found
# song_4_find = Song.find_by_name("Blank Space")
# song_5_find = Song.find_by_name("Alison")
#
# # found or created
# song_5_find_or_create = Song.find_or_create_by_name("Alison")
#
# # new from file name
# song_6 = Song.new_from_filename("Michael Jackson - Thriller.mp3")
#
# # create from file name
# song_7 = Song.create_from_filename("Taylor Swift - Call Me Maybe.mp3")
#
# pry.start
#
# true
