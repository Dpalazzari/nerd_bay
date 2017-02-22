require 'rails_helper'

RSpec.describe "Visitor can create a new account" do
  scenario 'from new user path' do
    visit new_user_path

    fill_in 'user[name', with: 'Drew'
    fill_in 'user[email]', with: 'd@d'
    fillin 'user[password]', with: 'password'
    click_on 'Create User'

    expect(page).to have_content("Successfully created account!")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")
  end
end