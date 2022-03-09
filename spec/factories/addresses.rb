require 'faker'
FactoryBot.define do
  factory :address do |f|
    f.name { Faker::Name.name }
  end
end