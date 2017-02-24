require 'rails_helper'

RSpec.describe 'User' do
  context 'logged in' do
    xit "sees weather data for that user's city" do
      user = create(:user)
      page.set_rack_session(user_id: user.id)

      visit dashboard_path

      expect(page).to have_content("Today's Forecast:")
    end
  end
end