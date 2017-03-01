require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_uniqueness_of :email }
  end

  context '.social_login' do
    it 'returns false on social_login status' do
      user = create(:user)
      
      expect(user.social_login).to be_falsey
    end

    it 'returns true on social_login status' do
      user = create(:user, social_login: true)

      expect(user.social_login?).to be_truthy
    end
  end
end
