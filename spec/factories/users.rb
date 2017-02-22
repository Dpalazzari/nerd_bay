FactoryGirl.define do
  factory :user do
    name Faker::GameOfThrones.character
    email Faker::Internet.email
    password_digest "password"
  end
end
