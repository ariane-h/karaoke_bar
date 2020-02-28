require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("The Green Room", 15, @playlist1 )
    @playlist
  end

  def test_room_name
    assert_equal("The Green Room", @room1.name)
  end

  def test_empty_seats
    assert_equal(15, @room1.seats)
  end

#write playlist test

  def test_on_peak_room_fee
    assert_equal(30, @room1.room_fee)
  end

end
