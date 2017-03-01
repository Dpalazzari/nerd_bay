require 'rails_helper'

describe UsersController do
  context '.weather' do
    it 'request is successful' do
      VCR.use_cassette("users_controller.weather") do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        get :weather
      end
    end
  end

  context '.youtube' do
    it 'request is successful' do
      VCR.use_cassette("users_controller.youtube") do
        get :youtube
      end
    end
  end
end