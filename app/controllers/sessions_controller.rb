class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:info] = "Successfully logged in."
      redirect_to dashboard_path
    else
      flash[:danger] = 'Login failed'
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:info] = "See you later, nerd."
    redirect_to root_path
  end

end