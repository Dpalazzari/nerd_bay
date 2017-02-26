class User < ApplicationRecord
  has_secure_password validations: false, if: :social_login?

  validates :name, :city, :password_digest, :email, presence: true
  validates :password_digest, :email, confirmation: true
  validates :name, :email, uniqueness: true

  def self.from_omniauth(info, token)
    find_or_create_by(uid: info['id']) do |user|
      user.uid             = info['id']
      user.name            = info['name']
      user.email           = info['email']
      user.token           = token
      user.city            = 'Denver'
      user.social_login    = true
      user.password_digest = User.generate_password
    end
  end

  def self.generate_password
    password_digest = SecureRandom.hex if password_digest.nil?
  end

  def social_login?
    self.social_login.eql?(true)
  end
end
