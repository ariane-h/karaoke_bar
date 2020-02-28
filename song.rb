class Song

  attr_accessor :playlist
  attr_reader :song, :song_genre, :song_title, :song_artist

  def initialize(song)
    @song = song
    @song_title = song[:title]
    @song_artist = song[:artist]
    @song_genre = song[:genre]
    @playlist = []
  end

  def playlist_count
    return @playlist.count
  end

  # def add_song_to_playlist(new_song)
  #   return @playlist.push(new_song)
  # end

end
