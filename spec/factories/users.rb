FactoryGirl.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    password "password"
    email { Faker::Internet.email(name) }
  end
end