require 'rails_helper'

RSpec.describe 'User can log out' do

  before(:each) do
    @user = create(:user)
  end

  context 'a logged in user' do
    scenario 'a user should see a logout button' do
      VCR.use_cassette('user_sees_logout_button_on_home_page') do
        page.set_rack_session(user_id: @user.id)
        visit root_path

        expect(page).to have_link('Logout')
        expect(page).to have_content("Logged in as #{@user.name}")
      end
    end

    scenario 'a user clicks on logout' do
      VCR.use_cassette('user_clicks_on_logout_from_home_page') do
        page.set_rack_session(user_id: @user.id)
        visit root_path

        click_on 'Logout'
        expect(current_path).to eq(root_path)
        expect(page).to have_link('Login')
        expect(page).to_not have_link('Logout')
        expect(page).to have_content("See you later, nerd.")
      end
    end
  end

end