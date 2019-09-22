class Room

  attr_reader :room_number, :occupants, :songs
  attr_accessor :till

  def initialize(room_number)
    @room_number = room_number
    @occupants = []
    @songs = []
    @max_capacity = 3
    @entry_fee = 3
    @till = 0
  end

  def check_in_guest(guest)
    if @occupants.length() < @max_capacity
      @occupants.push(guest)
      guest.wallet -= @entry_fee
      @till += @entry_fee
    end
  end

  def check_out_guest(guest)
    @occupants.delete(guest)
  end

  def add_song_to_room(song)
    @songs.push(song)
  end

  #
  # def celebrate_fav_song()
  #   for occupant in @occupants
  #     for song in @songs
  #       if song.name == occupant.favourite_song
  #         return "Whoo!"
  #       end
  #     end
  #   end

  def celebrate_fav_song()
    for occupant in @occupants
      # binding.pry
      if @songs.any? { |song| song.name == occupant.favourite_song }
        return "Whoo!"
      end
    end
  end


end
