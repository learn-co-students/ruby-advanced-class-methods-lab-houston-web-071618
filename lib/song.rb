

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
    song = self.new
    all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    all.find { |song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if song == nil
      create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    file_name = file_name.split(/[-.]/)
    file_name = file_name.map {|word|
        word.lstrip.rstrip
    }
    name = file_name[1]
    artist = file_name[0]

    find_or_create_by_name(name)
    find_by_name(name).artist_name = artist
    find_by_name(name)
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name)
  end

  def self.destroy_all
    all.clear
  end

end
