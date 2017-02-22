require 'rails_helper'

RSpec.feature 'User log in' do
  
  before(:each) do
    @user  = create(:user)
    @user2 = create(:user, name: 'Bilbo', email: 'bilbo@bilbo', password: 'gandalf4lyfe')
  end

  it 'can login with proper credentials' do
    visit root_path
    
    expect(page).to have_link("Login")
    click_on "Login"

    expect(current_path).to eq(login_path)

    within("form") do
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      click_on "Login"
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{@user.name}")
    expect(page).to have_content("Successfully logged in")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")
  end

  it "cannot log in from home page with email that is not in user database" do
    visit root_path

    expect(page).to have_link("Login")
    click_on "Login"

    expect(current_path).to eq(login_path)

    within("form") do
      fill_in "email", with: "incorrect_email"
      fill_in "password", with: @user.password
      click_on "Login"
    end

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Login failed')
    expect(page).to have_link('Login')
    expect(page).not_to have_link('Logout')
  end

  it "cannot log in from home page with email of another user" do
    visit root_path

    expect(page).to have_link("Login")
    click_on "Login"

    expect(current_path).to eq(login_path)
    
    within("form") do
      fill_in "email", with: @user2.email
      fill_in "password", with: @user.password
      click_on "Login"
    end

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Login failed')
    expect(page).to have_link('Login')
    expect(page).not_to have_link('Logout')
  end
end