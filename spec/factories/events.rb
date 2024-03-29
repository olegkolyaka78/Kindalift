require 'faker'
FactoryBot.define do
  factory :event do |f|
    f.name { Faker::Name.name }
    f.start_time { Faker::Time.start_time }
    f.end_time { Faker::Time.end_time }
    f.phone { Faker::Number.number(digits: 10) }
    f.email { Faker::Internet.email }
    association :address
  end
end
