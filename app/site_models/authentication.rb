class Authentication

  def self.github_sign_in(code)
    response   = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV["client_id"]}&client_secret=#{ENV["client_secret"]}&code=#{code}")
    token      = response.body.split(/\W+/)[1]
    user_data  = Faraday.get("https://api.github.com/user?access_token=#{token}")
    user_info  = JSON.parse(user_data.body)
    User.from_omniauth(user_info, token)
  end

end