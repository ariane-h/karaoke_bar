require('pry-byebug')

require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../song")
require_relative("../room")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new({title: "Little Deuce Coupe", artist: "Beach Boys", genre: "60's"})
    @song2 = Song.new({title: "Psycho Killer", artist: "Talking Heads", genre: "70's"})
    @song3 = Song.new({title: "Head Over Heels", artist: "Tears for Fears", genre: "80's"})
    @song4 = Song.new({title: "Creep", artist: "Radiohead", genre: "90's"})
    @song5 = Song.new({title: "In da Club", artist: "50 Cent", genre: "2000's"})

  end

  def test_get_song_title
    assert_equal("Psycho Killer", @song2.song_title)
    assert_equal("In da Club", @song5.song_title)
  end

  def test_get_song_artist
    assert_equal("Tears for Fears", @song3.song_artist)
    assert_equal("50 Cent", @song5.song_artist)
  end

  def test_get_song_genre
    assert_equal("60's", @song1.song_genre)
    assert_equal("90's", @song4.song_genre)
  end

end
