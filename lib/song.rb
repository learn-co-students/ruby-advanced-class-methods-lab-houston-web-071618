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

  #self.create instantiates & saves the song. Returns the new song created.
  def self.create
    song = self.new()
    @@all << song
    song
  end

  #instantiates a song with a name property
  def self.new_by_name(name)
    song = self.new()
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    new_by_name(name)
  end

  def self.find_by_name(name)
     found = nil
      @@all.each do |item|
        if item.name == name
          return item
        end #if
      end #each
     found
  end #self.find_by_name

  def self.find_or_create_by_name(name)
    found = find_by_name(name)
    if !found
      is_created = create_by_name(name)
      return is_created
    else
      return found
    end
  end #self.find_or_create_by_name

  def self.alphabetical
      @@all.sort do |a, b|
        a.name <=> b.name
      end
  end #self.alphabetical

  def self.new_from_filename(song_w_filename)
    #fileformat = "<artist_name> - <song_name>.mp3"
    array = song_w_filename.split(/[-.]/)
    song = self.new()
    song.artist_name = array[0].strip
    song.name = array[1].strip
    @@all << song
    song
  end #self.new_from_filename

  def self.create_from_filename(song_w_filename)
    new_from_filename(song_w_filename)
  end #self.create_from_filename

  def self.destroy_all
    @@all = []
  end #self.destroy_all

end #Song
