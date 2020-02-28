class Guest

  attr_accessor :wallet
  attr_reader :name, :favourite_song, :favourite_genre

  def initialize(name, favourite_song, favourite_genre, wallet )
    @name = name
    @favourite_song = favourite_song
    @favourite_genre = favourite_genre
    @wallet = wallet
  end

end
