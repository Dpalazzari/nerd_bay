require 'rails_helper'

RSpec.describe 'Visitor', type: :feature do
  context 'visits nerd bays root path' do
    it 'sees a navbar and about me information' do
      visit root_path

      expect(page).to have_link('About')
      expect(page).to have_link('Home')
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Log In')
    end
  end
end