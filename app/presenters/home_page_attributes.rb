class HomePageAttributes

  def streams
    Twitch.get_streams
  end

  def movies
    MovieDatabase.now_playing
  end

end