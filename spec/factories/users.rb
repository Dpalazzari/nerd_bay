FactoryGirl.define do
  factory :user do
    name Faker::GameOfThrones.character
    email Faker::Internet.email
    city 'Denver'
    password "password"
  end
end
