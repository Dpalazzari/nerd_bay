require 'rails_helper'

RSpec.describe 'User' do
  context 'tries to login through github' do
    it 'fails to authenticate' do
      VCR.use_cassette('login_thru_github_fails') do
        visit auth_github_callback_path

        expect(page).to have_content('Authentication failed')
        expect(current_path).to eq(root_path)
      end
    end
  end
end