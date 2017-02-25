class HomePageAttributes

  def streams
    Twitch.get_streams
  end

  def movies
    MovieDatabase.now_playing
  end

  def articles
    IgnArticles.newest
  end

  def giphys
    Giphy.trending
  end

end