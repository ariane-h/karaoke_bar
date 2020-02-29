require('pry-byebug')
require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../song")
require_relative("../guest")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("The Green Room", 15,  )

    @guest1 = Guest.new("Gabbi", "Psycho Killer", "70's", 80)

    @song1 = Song.new({title: "Little Deuce Coupe", artist: "Beach Boys", genre: "60's"})
    @song2 = Song.new({title: "Psycho Killer", artist: "Talking Heads", genre: "70's"})
    @song3 = Song.new({title: "Head Over Heels", artist: "Tears for Fears", genre: "80's"})
    @song4 = Song.new({title: "Creep", artist: "Radiohead", genre: "90's"})
    @song5 = Song.new({title: "In da Club", artist: "50 Cent", genre: "2000's"})

    @playlist1 = [@song1, @song3, @song5, @song1, @song2, @song4, @song1 ]

  end

  #getter tests

  def test_room_name
    assert_equal("The Green Room", @room1.name)
  end

  def test_empty_seats
    assert_equal(15, @room1.empty_seats)
  end

  def test_on_peak_room_fee
    assert_equal(30, @room1.room_fee)
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

  # check in/out tests
  def test_count_guests_in_room
    assert_equal(0, @room1.count_guests_in_room)
  end

  def test_check_in_guest
    @room1.check_in_guest(@guest1)
    assert_equal(1, @room1.count_guests_in_room)
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

end
