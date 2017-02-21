require 'rails_helper'

RSpec.describe 'Visitor', type: :feature do
  context 'visits nerd bays root path' do
    it 'sees a navbar and about me information' do
      visit root_path

      expect(page).to have_link('About')
      expect(page).to have_link('Home')
      expect(page).to have_link('Sign Up')
      expect(page).to have_link('Login')
      expect(page).to have_selector('.home-page')
    end
  end
end