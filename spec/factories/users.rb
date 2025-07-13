FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    sequence(:email)      { Faker::Internet.unique.email }
    password              { "1a#{Faker::Internet.password(min_length: 6, mix_case: true)}" }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '陸太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birth_date            { 18.years.ago }
  end
end
