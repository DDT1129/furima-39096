FactoryBot.define do
  factory :order_address do
    post_code          { '123-4567' }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    municipalities     { Faker::Address.city }
    house_umber        { Faker::Address.street_address }
    building           { Faker::Address.street_address }
    phone              { Faker::Number.between(from: 1_000_000_000, to: 99_999_999_999) }

    user_id            { Faker::Number.non_zero_digit }
    market_id          { Faker::Number.non_zero_digit }

    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
