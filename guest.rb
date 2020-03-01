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

  def find_song_on_playlist(playlist, song)
    playlist.find(song) && song.song_title == @favourite_song
  end


  def hears_favourite_song(room, playlist, song)
    room.load_existing_playlist(playlist)
    if find_song_on_playlist(playlist, song)
      p "YASSS! This is my jaaam!"
    else
      p "Ah, it's not on the list"
    end
  end

end
