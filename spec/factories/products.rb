FactoryBot.define do
  factory :product do
    name { Faker::StarWars.droid }
    description { Faker::Lorem.sentence }
    height { Faker::Number.decimal(2)}
    width { Faker::Number.decimal(2)}
    lenght { Faker::Number.decimal(2)}
    weight { Faker::Number.decimal(2)}
    price { Faker::Number.decimal(2)}
  end
end