require('pry-byebug')

class Room

  attr_accessor :guests, :playlist, :empty_seats, :till
  attr_reader :name, :room_fee

  def initialize(name, empty_seats, room_fee)
      @name = name
      @empty_seats = empty_seats
      @guests = []
      @playlist = []
      @room_fee = room_fee
      @till = 0
  end


  def charge_room_fee(guest)
    guest.wallet -= @room_fee
    @till += @room_fee
  end

  #guest functions

  def count_guests_in_room
    return @guests.count
  end

  def remove_empty_seat
    @empty_seats -= 1
  end

  def check_in_guest(new_guest)
    if @empty_seats >= 1
      @guests << new_guest
      remove_empty_seat()
    else
      puts "Sorry! #{new_guest.name} we're fully booked."
    end
  end

  def check_out_guest(guest)
    @guests.delete(guest)
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
