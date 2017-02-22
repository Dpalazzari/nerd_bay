class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:sucess] = "Successfully logged in."
      redirect_to dashboard_path
    else
      flash[:danger] = 'Login failed'
      redirect_to login_path
    end
  end

end