class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully created account!"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:danger] = "All fields must be filled in to create account."
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end