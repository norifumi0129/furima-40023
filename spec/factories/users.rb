require 'faker/japanese'

FactoryBot.define do
  factory :user do
    nickname  { Faker::Name.unique.name } #ニックネームのようなダミーデータの生成
    email      { Faker::Internet.unique.email } # メールアドレスのようなダミーデータの生成
    password { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    family_name { Faker::Japanese::Name.last_name } 
    first_name { Faker::Japanese::Name.first_name }
    family_name_kana { "ササキ" }
    first_name_kana { "コジロー" }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end