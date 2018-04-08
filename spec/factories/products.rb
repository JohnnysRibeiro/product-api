FactoryBot.define do
  factory :product do
    name { Faker::StarWars.droid }
    description { Faker::Lorem.sentence }
    height { Faker::Number.between(16,20)}
    width { Faker::Number.between(16,20)}
    lenght { Faker::Number.between(16,20)}
    weight { Faker::Number.between(16,20)}
    price { Faker::Number.between(16,20)}
  end
end