class Room

  attr_accessor :seats, :playlist
  attr_reader :name, :room_fee

  def initialize(name, seats, playlist)
      @name = name
      @seats = seats
      @playlist = []
      @room_fee = 30
  end








end
