require("minitest/autorun")
require("minitest/rg")
require_relative("../guests.rb")

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new("Alex")
  end

  def test_get_guest_name()
    assert_equal("Alex", @guest1.name)
  end


end
