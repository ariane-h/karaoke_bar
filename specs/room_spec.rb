require('pry-byebug')
require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../song")
require_relative("../guest")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("The Green Room", 15, 20)
    @room2 = Room.new("The Orange Room", 3, 50 )

    @guest1 = Guest.new("Gabi", "Psycho Killer", "70's", 80)
    @guest2 = Guest.new("Kristiina", "Creep", "Radiohead", 50)
    @guest3 = Guest.new("Jim", "Little Deuce Coupe", "60's", 20)

    @song1 = Song.new({title: "Little Deuce Coupe", artist: "Beach Boys", genre: "60's"})
    @song2 = Song.new({title: "Psycho Killer", artist: "Talking Heads", genre: "70's"})
    @song3 = Song.new({title: "Head Over Heels", artist: "Tears for Fears", genre: "80's"})
    @song4 = Song.new({title: "Creep", artist: "Radiohead", genre: "90's"})
    @song5 = Song.new({title: "In da Club", artist: "50 Cent", genre: "2000's"})

    @playlist1 = [@song1, @song3, @song5, @song1, @song2, @song4, @song1 ]
    @playlist2 = [@song1, @song3, @song4]


  end

  def test_room_name
    assert_equal("The Green Room", @room1.name)
  end

  def test_empty_seats
    assert_equal(15, @room1.empty_seats)
  end

  def test_get_room_fee
    assert_equal(20, @room1.room_fee)
  end

  def test_charge_room_fee
    @room2.charge_room_fee(@guest1)
    assert_equal(30, @guest1.wallet)
    assert_equal(50, @room2.till)
  end

  def test_can_guest_afford
    @room2.can_guest_afford(@guest1)
    assert_equal(true, @room2.can_guest_afford(@guest1))
  end

  def test_can_guest_cannot_afford
    assert_equal(false, @room2.can_guest_afford(@guest3))
  end

  #playlist tests

  def test_playlist_starts_empty?
    assert_equal(true, @playlist.nil?)
  end

  def test_playlist_count
    assert_equal(0, @room1.playlist_count())
  end

  def test_add_song_to_playlist
    @room1.add_song_to_playlist(@song3)
    assert_equal(1, @room1.playlist_count)
  end

  def test_add_multiple_songs_to_playlist
    @room1.add_song_to_playlist(@song3)
    @room1.add_song_to_playlist(@song2)
    @room1.add_song_to_playlist(@song1)
    assert_equal(3, @room1.playlist_count)
  end

  def test_load_existing_playlist
    @room1.load_existing_playlist(@playlist1)
    assert_equal(7, @room1.playlist_count)
  end

  def test_list_currently_playing
    @room1.load_existing_playlist(@playlist2)
    result = @room1.list_currently_playing(@playlist2)
    assert_equal(3, result)
  end

  # check guest in/out tests

  def test_count_guests_in_room
    assert_equal(0, @room1.count_guests_in_room)
  end

  def test_check_in_guest
    @room1.check_in_guest(@guest1)
    assert_equal(1, @room1.guests.count)
  end

  def test_check_out_guest
    @room1.check_out_guest(@guest1)
    assert_equal(0, @room1.count_guests_in_room)
  end

  def test_check_in_multiple_guests
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest1)
    assert_equal(3, @room1.count_guests_in_room)
  end

  def test_remove_empty_seat
    @room2.remove_empty_seat()
    assert_equal(2, @room2.empty_seats)
  end

  def test_check_in_guest_not_enough_space
    @room2.check_in_guest(@guest1)
    @room2.check_in_guest(@guest1)
    @room2.check_in_guest(@guest2)
    @room2.check_in_guest(@guest1)
    @room2.check_in_guest(@guest2)
    assert_equal(0, @room2.empty_seats)
    assert_equal(3, @room2.guests.count)
  end

  def test_guest_wallet_amount
    assert_equal(80, @guest1.wallet)
  end

end
