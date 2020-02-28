require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Gabbi", "Psycho Killer", "Talking Heads", "70's")
  end

  def test_guest_name
    assert_equal
  end

end
