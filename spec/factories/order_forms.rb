FactoryBot.define do
  factory :order_form do
    token                 { 'tok_abcdefghijk00000000000000000' }
    post_code             { Faker::Address.postcode }
    prefecture_id         { Faker::Number.within(range: 1..47) }
    municipality          { Faker::Address.city }
    street_number         { Faker::Address.street_address }
    building              { Faker::Address.building_number }
    phone_number          { Faker::Number.number(digits: 11) }
  end
end
