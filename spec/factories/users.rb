FactoryBot.define do
  factory :user do
    nickname              {'TEST'}
    email                 {'test@test.com'}
    password              {'fukushima2023'}
    encrypted_password    {'password'}
    first_name            {'試験'}
    last_name             {'試験'}
    first_name_kana       {'シケン'}
    last_name_kana        {'シケン'}
    birthday              {'2023-05-30'}
  end
end