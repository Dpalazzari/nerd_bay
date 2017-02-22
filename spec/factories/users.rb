FactoryGirl.define do
  factory :user do
    name Faker::GameOfThrones.character
    email Faker::Internet.email
    city Faker::Address.city
    password "password"
  end
end
