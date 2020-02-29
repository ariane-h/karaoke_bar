require('pry-byebug')

class Guest

  attr_accessor :wallet
  attr_reader :name, :favourite_song, :favourite_genre

  def initialize(name, favourite_song, favourite_genre, wallet )
    @name = name
    @favourite_song = favourite_song
    @favourite_genre = favourite_genre
    @wallet = wallet
  end

  def hears_favourite_song(song)
    if song.song_title == @favourite_song
      return "YASSS! This is my jaaam!"
    else
      return "Next please"
    end
  end

end
