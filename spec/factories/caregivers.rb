require 'faker'
FactoryBot.define do
  factory :caregiver do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.phone { Faker::Number.number(digits: 10) }
    f.email { Faker::Internet.email }
    association :address
  end
end
