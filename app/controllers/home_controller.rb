class HomeController < ApplicationController

  def index
    @presenter = HomePageAttributes.new
  end

end