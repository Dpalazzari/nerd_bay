require 'rails_helper'

RSpec.describe "Visitor can create a new account" do
  scenario 'from new user path' do
    visit new_user_path

    fill_in 'user[name]', with: 'Drew'
    fill_in 'user[email]', with: 'd@d'
    fill_in 'user[password]', with: 'password'
    click_on 'Create User'

    expect(page).to have_content("Successfully created account!")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")
  end

  scenario 'account creation is unsuccessful' do
    visit new_user_path

    fill_in 'user[name]', with: "Bilbo"
    fill_in 'user[email]', with: 'b@b'
    click_on 'Create User'

    expect(current_path).to eq(users_path)
    expect(page).to have_content("All fields must be filled in to create account.")
  end
end