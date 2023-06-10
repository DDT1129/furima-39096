FactoryBot.define do
  factory :market do
    name                        { 'TEST' }
    explanation                 { 'TEST' }
    category_id                 { 2 }
    detail_id                   { 2 }
    shipping_price_id           { 2 }
    prefecture_id               { 2 }
    shipping_date_id            { 2 }
    price                       { 300 }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
