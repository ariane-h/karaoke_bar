class Song

  attr_reader :song, :song_genre, :song_title, :song_artist

  def initialize(song)
    @song = song
    @song_title = song[:title]
    @song_artist = song[:artist]
    @song_genre = song[:genre]

  end

  def playlist_length
    return @playlist.count
  end



end
