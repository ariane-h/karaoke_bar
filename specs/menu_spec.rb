require('pry-byebug')
require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../menu")
require_relative("../guest")
require_relative("../room")

class MenuTest < MiniTest::Test

  def setup
    @menuitem1 = Menu.new("chips", 4)
    @menuitem2 = Menu.new("cup noodles", 4)
    @menuitem3 = Menu.new("pizza", 10)
    @menuitem4 = Menu.new("soft drink", 3)
    @menuitem5 = Menu.new("beer", 4)
    @menuitem6 = Menu.new("wine", 5)
  end

  def test_get_item
    assert_equal("cup noodles", @menuitem2.name)
  end

  def test_get_price
    assert_equal(4, @menuitem2.price)
  end

end
