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
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      if song_name == song.name
      song
    else
      false
    end
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ").last.split(".").first
    artist_name = filename.split(" - ").first

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song_name = filename.split(" - ").last.split(".").first
    artist_name = filename.split(" - ").first

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
