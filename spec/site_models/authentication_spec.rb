require 'rails_helper'

describe Authentication do
  context '.github_sign_in' do
    it 'authenticates a user' do
      VCR.use_cassette('authentication.github_sign_in') do
        user = Authentication.github_sign_in(ENV['github_token'])

        expect(user).to be_a(User)
      end
    end
  end
end