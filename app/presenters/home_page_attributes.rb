class HomePageAttributes

  def streams
    Twitch.get_streams
  end

  def movies
    MovieDatabase.now_playing
  end

  def ign_articles
    IgnArticles.newest
  end

  def hacker_articles
    HackerArticles.top_articles
  end

  def espn_articles
    EspnArticles.top_articles
  end

  def reddit
    RedditThreads.top_threads
  end

end