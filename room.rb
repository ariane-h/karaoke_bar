class Room

  attr_accessor :seats, :playlist
  attr_reader :name, :room_fee

  def initialize(name, seats, playlist)
      @name = name
      @seats = seats
      @playlist = []
      @room_fee = 30
  end


  def playlist_length
    return @playlist.count
  end

  def test_playlist_empty?
    assert_equal(true, @playlist.nil?)
  end

  

end
