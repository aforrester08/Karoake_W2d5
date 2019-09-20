require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms.rb")
require_relative("../guests.rb")
require_relative("../songs.rb")

class TestRoom < Minitest::Test

  def setup
    @room1 = Room.new(1)
    @guest1 = Guest.new("Alex")
    @guest2 = Guest.new("David")
  end

  def test_get_room_number()
    assert_equal(1, @room1.room_number)
  end

  def test_check_in_guest()
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    assert_equal([@guest1, @guest2], @room1.occupants)
  end

  def test_check_out_guest()
    @room1.check_in_guest(@guest1)
    @room1.check_out_guest(@guest1)
    assert_equal([], @room1.occupants)
  end

  
end
