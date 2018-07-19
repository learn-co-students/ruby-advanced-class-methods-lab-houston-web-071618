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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song_instance|
      if song_name == song_instance.name
        song_instance
      end
    end
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      song = Song.find_by_name(name)
    else
      song = create_by_name(name)
    end
  end

  def self.alphabetical
    array = []
    new_all = []
    @@all.map do |song_instance|
      array << song_instance.name
    end
    array = array.sort
    array.each do |song|
      @@all.each do |song_instance|
        if song == song_instance.name
          new_all << song_instance
        end
      end
    end
    new_all
  end

  def self.new_from_filename(song_mp3)
    parsed_song = song_mp3.split(' - ')
    removed_mp3 = parsed_song.last
    removed_mp3.slice! ".mp3"
    new_song = Song.new
    new_song.name = parsed_song[1]
    new_song.artist_name = parsed_song[0]
    new_song
    #binding.pry
  end

  def self.create_from_filename(song_mp3)
    new_song = new_from_filename(song_mp3)
    new_song.save
  end

  def self.destroy_all
    @@all = []
  end


end
