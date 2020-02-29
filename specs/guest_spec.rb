require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")
require_relative("../song")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Gabbi", "Psycho Killer", "70's", 80)

    @song1 = Song.new({title: "Little Deuce Coupe", artist: "Beach Boys", genre: "60's"})
    @song2 = Song.new({title: "Psycho Killer", artist: "Talking Heads", genre: "70's"})
    @song3 = Song.new({title: "Head Over Heels", artist: "Tears for Fears", genre: "80's"})
    @song4 = Song.new({title: "Creep", artist: "Radiohead", genre: "90's"})
    @song5 = Song.new({title: "In da Club", artist: "50 Cent", genre: "2000's"})
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

  # Guests could have a favourite song, and if their favourite song is on the room's playlist, they can cheer loudly! (return a string like "Whoo!")
  def test_hears_favourite_song
    result = @guest1.hears_favourite_song(@song2)
    assert_equal("YASSS! This is my jaaam!", result)
  end

end
