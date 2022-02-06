FactoryBot.define do
  factory :contact do
    address { Faker::Lorem.word }
    email { 'foo@bar.com' }
    phone { Faker::Number.number(10) }
    created_by { Faker::Number.number(10) }
  end
end
