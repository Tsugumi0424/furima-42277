FactoryBot.define do
  factory :item do
    title              { Faker::Lorem.characters(number: 40) }
    description        { Faker::Lorem.sentence }
    category_id        { Faker::Number.within(range: 1..10) }
    condition_id       { Faker::Number.within(range: 1..6) }
    shipping_cost_id   { Faker::Number.within(range: 1..2) }
    prefecture_id      { Faker::Number.within(range: 1..47) }
    shipping_time_id   { Faker::Number.within(range: 1..3) }
    price              { Faker::Number.within(range: 300..9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end

  end
end
