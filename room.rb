require('pry-byebug')

class Room

  attr_accessor :seats, :playlist
  attr_reader :name, :room_fee

  def initialize(name, seats)
      @name = name
      @seats = seats
      @playlist = []
      @room_fee = 30
  end


  #playlist functions - add song to room

  def playlist_count
    return @playlist.count
  end

  def add_song_to_playlist(song)
   @playlist.push(song)
  end

  def load_existing_playlist(existing_playlist)
    @playlist = existing_playlist.map {|song| @playlist << song }
    return @playlist
  end


end
