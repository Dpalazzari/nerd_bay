require 'rails_helper'

RSpec.describe 'Visitor', type: :feature do
  context 'visits nerd bay' do
    it 'sees a navbar' do
      visit root_path

      expect(page).to have_link('About')
      expect(page).to have_link('Home')
      expect(page).to have_link('Sign Up')
      expect(page).to have_link('Login')
    end
  end
end