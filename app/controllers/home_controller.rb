class HomeController < ApplicationController

  def index
    @streams = Twitch.get_streams
  end

end