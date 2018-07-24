require "pry"

class Song
  attr_accessor :name, :artist_name, :create
  @@all = []

  def self.all
    @@all << self
  end

  def self.create
    self
  end

  def self.new_by_name(name)
    self.name
  end

  def save
    self.class.all << self
  end

end

song2 = Song.create
song3 = Song.new_by_name("Song3")

pry.start

false
