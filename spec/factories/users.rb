FactoryGirl.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    password_digest "password"
    email { Faker::Internet.email(name) }
  end
end
