class Room

  attr_reader :room_number, :occupants, :songs

  def initialize(room_number)
    @room_number = room_number
    @occupants = []
    @songs = []
  end

  def check_in_guest(guest)
    @occupants.push(guest)
  end

  def check_out_guest(guest)
    @occupants.delete(guest)
  end
end
