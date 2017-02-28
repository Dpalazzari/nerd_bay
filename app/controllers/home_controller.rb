class HomeController < ApplicationController

  def index
    @stream = HomePageAttributes.new.streams
  end

  def twitch_call
    @streams = HomePageAttributes.new.streams
    render partial: 'shared/twitch'
  end

  def movie_call
    @movies = HomePageAttributes.new.movies
    render partial: 'shared/movies'
  end

  def ign_call
    @articles = HomePageAttributes.new.ign_articles
    render partial: 'shared/ign'
  end

  def hackers
    @articles = HomePageAttributes.new.hacker_articles
    render partial: 'shared/hacker'
  end

  def espn
    @articles = HomePageAttributes.new.espn_articles
    render partial: 'shared/espn'
  end

  def reddit
    @threads = HomePageAttributes.new.reddit
    render partial: 'shared/reddit'
  end

end