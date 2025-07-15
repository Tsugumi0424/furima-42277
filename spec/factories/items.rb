FactoryBot.define do
  factory :item do
    title              { Faker::Lorem.characters(number: 40) }
    description        { Faker::Lorem.sentence }
    category_id        { Faker::Number.within(range: 2..11) }
    condition_id       { Faker::Number.within(range: 2..7) }
    shipping_cost_id   { Faker::Number.within(range: 2..3) }
    prefecture_id      { Faker::Number.within(range: 2..48) }
    shipping_time_id   { Faker::Number.within(range: 2..4) }
    price              { Faker::Number.within(range: 300..9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end

  end
end
