require('pry-byebug')
require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bar")
require_relative("../room")
require_relative("../guest")
require_relative("../menu")

class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new()
  end

  def test_bar_tab_total
    assert_equal(0, @bar.tab)
  end

  def test_take_guest_order

    assert_equal("pizza", bar.menu)
  end

  # def test_serve_guest
  #   @bar.take_guest_order(@menu)
  #   @bar.serve_guest(@guest1, @menu)
  #   assert_equal(10, @bar.tab)
  #   assert_equal(70, @guest1.wallet)
  # end

end
