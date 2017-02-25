class UserPageAttributes

  attr_reader :current_user

  def initialize(user)
    @current_user = user
  end

  def weather
    Weather.get_data(current_user.city)
  end

  def quote
    Quote.of_the_day
  end

   def giphy
    Giphy.trending
  end

end