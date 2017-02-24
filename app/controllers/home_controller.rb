class HomeController < ApplicationController

  def index
    @presenter = HomePageAttributes.new
    # @streams = Twitch.get_streams
    # @movies  = MovieDatabase.now_playing 
  end

end