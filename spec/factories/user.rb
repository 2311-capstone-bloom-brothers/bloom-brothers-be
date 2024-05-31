FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    location { Faker::Address.full_address }
    password { "FakePassword1!" }
  end
end