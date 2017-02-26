class GithubController < ApplicationController

  def create
    user = Authentication.github_sign_in(params[:code])
    if user.save
      session[:user_id] = user.id
      flash[:info] = "Successfully Logged in with Github!"
      redirect_to dashboard_path
    else
      flash[:danger] = 'Authentication failed.'
      redirect_to root_path
    end
  end

end