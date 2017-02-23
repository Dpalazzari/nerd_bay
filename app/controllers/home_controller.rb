class HomeController < ApplicationController

  def index
    @streams = Twitch.get_streams
    @movies  = MovieDatabase.now_playing 
  end

end