require 'rails_helper'

RSpec.describe 'Visitor' do 
  context 'who is not logged in' do
    scenario 'can not visit the dashboard path' do
      visit dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page).to have_selector(".four-o-four")
    end
  end
end