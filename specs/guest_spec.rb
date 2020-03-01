require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")
require_relative("../song")
require_relative("../room")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Gabbi", "Psycho Killer", "70's", 80)

    @room1 = Room.new("The Green Room", 15, 20)

    @song1 = Song.new({title: "Little Deuce Coupe", artist: "Beach Boys", genre: "60's"})
    @song2 = Song.new({title: "Psycho Killer", artist: "Talking Heads", genre: "70's"})
    @song3 = Song.new({title: "Head Over Heels", artist: "Tears for Fears", genre: "80's"})
    @song4 = Song.new({title: "Creep", artist: "Radiohead", genre: "90's"})
    @song5 = Song.new({title: "In da Club", artist: "50 Cent", genre: "2000's"})
    @song6 = Song.new({title: "Hotline Bling", artist: "Drake", genre: "2010's"})

    @playlist1 = [@song1, @song3, @song5, @song1, @song2, @song4, @song1 ]
    @playlist2 = [@song1, @song3, @song5, @song1, @song6, @song4, @song1 ]
  end

  def test_guest_name
    assert_equal("Gabbi", @guest1.name)
  end

  def test_favourite_song
    assert_equal("Psycho Killer", @guest1.favourite_song)
  end

  def test_favourite_genre
    assert_equal("70's", @guest1.favourite_genre)
  end

  def test_count_wallet
    assert_equal(80, @guest1.wallet)
  end

  def test_find_song_on_playlist
    @room1.load_existing_playlist(@playlist1)
    result = @guest1.find_song_on_playlist(@playlist1, @song2)
    assert_equal(true, result)
  end

  def test_hears_favourite_song
    @room1.load_existing_playlist(@playlist1)
    result = @guest1.hears_favourite_song(@room1, @playlist1, @song2)
    assert_equal("YASSS! This is my jaaam!", result)
  end

  def test_does_not_hear_favourite_song
    @room1.load_existing_playlist(@playlist2)
    result = @guest1.hears_favourite_song(@room1, @playlist2, @song1)
    assert_equal("Ah, it's not on the list", result)
  end


end
