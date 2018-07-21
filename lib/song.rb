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
    song = new
    song.save
    song
  end

  def self.new_by_name(name)
    song = new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = create
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name) 
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    all.uniq.sort_by { |x| x.name }
  end

  def self.new_from_filename(filename)
    array = filename.split(' - ')
    song = create
    song.name = array[1].gsub('.mp3', '')
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def self.destroy_all
    all.clear
  end
  
end
