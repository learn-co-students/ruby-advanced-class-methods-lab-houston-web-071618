require 'pry' #PRY IS LOVE, PRY IS LIFE!


class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "", artist_name = "")
    @name = name
    @artist_name = artist_name
    #@@all << self
    #save
  end
  def self.create
    all << self.new
    all.last
  end #COME BAC HERE A BIT LATER!!!!!

  def self.new_by_name(name)
    all << self.new(name)
    all.last #this part not specified by song_class_methods_spec.rb
  end
  def self.create_by_name(name)
    #binding.pry
    new_by_name(name)
  end
  def self.find_by_name(name)
    all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if(!find_by_name(name)) # IF NOT FOUND THEN MAKE ONE! :D
      create_by_name(name)
    else
      find_by_name(name) # Repeated for return value.
    end                  # not sure if IF statement can return
  end
  def self.alphabetical
    # we want a MODIFIED ARRAY (aka sorted version of @@all)
    # ALL > [SONG,SONG,SONG] need names > SORT NAMES > map
    all.map{|song| song.name}.sort.map{|name| find_by_name(name)}
  end
  def self.new_from_filename(file_name)
    formattedSong = formatSong(file_name)
    self.all << self.new(formattedSong.first, formattedSong.last)
    self.all.last
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name)
  end

  def self.destroy_all
    all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.formatSong(song_file_name)
    # will return an array of two things [name, artist]
    # I could simplify this if i just new some REGEX! >:O
    returnArray = []
    returnArray << song_file_name.split("-").last.split(".").first.strip
    returnArray << song_file_name.split("-").first.strip
  end

end

#returnValue =Song.find_or_create_by_name("Allison")
#
