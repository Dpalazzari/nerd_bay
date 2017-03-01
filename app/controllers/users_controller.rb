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
    if current_user
      @presenter = UserPageAttributes.new(current_user)
    else
      render file: "/public/404"
    end
  end

  def weather
    @weather = Weather.get_data(current_user.city)
    render partial: 'private/data'
  end

  def youtube
    @youtube = Rails.cache.read('youtube_link')
    render partial: 'private/youtube'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :city, :password)
  end

end