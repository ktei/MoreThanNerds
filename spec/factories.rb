require 'faker'

FactoryGirl.define do 
  factory :message do
    author Faker::Name.name
    email Faker::Internet.email
    content Faker::Lorem.sentence(5)
  end
end