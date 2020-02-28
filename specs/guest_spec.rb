require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Gabbi", "Psycho Killer", "70's", 80)
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

end
