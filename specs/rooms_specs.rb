require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms.rb")
require_relative("../guests.rb")
require_relative("../songs.rb")

class TestRoom < Minitest::Test

  def setup
    @room1 = Room.new(1)
    @guest1 = Guest.new("Alex", 20)
    @guest2 = Guest.new("David", 20)
    @guest3 = Guest.new("Oli", 20)
    @guest4 = Guest.new("Mikey", 20)
    @song1 = Song.new("Mr Brightside")
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

  def test_add_song_to_room()
    @room1.add_song_to_room(@song1)
    assert_equal([@song1], @room1.songs)
  end

  def test_max_room_capacity()
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    @room1.check_in_guest(@guest4)
    assert_equal([@guest1, @guest2, @guest3], @room1.occupants)
  end

  def test_entry_fee()
    @room1.check_in_guest(@guest1)
    assert_equal(17, @guest1.wallet)
  end
end
