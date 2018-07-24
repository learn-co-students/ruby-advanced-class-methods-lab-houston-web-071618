require "pry"

class Song

  attr_accessor :name, :create

  def self.create
    self
  end

  def self.new_by_name(name)
    @name = name
  end

end

song = Song.create
song2 = Song.new_by_name("Blank Space")


pry.start

true
