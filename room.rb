require('pry-byebug')

class Room

  attr_accessor :guests, :playlist, :empty_seats
  attr_reader :name, :room_fee

  def initialize(name, empty_seats)
      @name = name
      @empty_seats = empty_seats
      @guests = []
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

  def count_guests_in_room
    return @guests.count
  end

  def check_in_guest(new_guest)
    @guests.push(new_guest)
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end


end
