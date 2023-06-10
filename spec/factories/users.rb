FactoryBot.define do
  factory :user do
    nickname              { 'TEST' }
    email                 { Faker::Internet.free_email }
    password              { 'fukushima2023' }
    password_confirmation { password }
    first_name            { '試験' }
    last_name             { '試験' }
    first_name_kana       { 'シケン' }
    last_name_kana        { 'シケン' }
    birthday              { '2023-05-30' }
  end
end
