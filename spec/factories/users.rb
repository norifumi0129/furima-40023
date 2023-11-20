FactoryBot.define do
  factory :user do
    nickname  { Faker::Name.unique.name } #ニックネームのようなダミーデータの生成
    email      { Faker::Internet.unique.email } # メールアドレスのようなダミーデータの生成
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    family_name_kana { Faker::Name.name }
    first_name_kana { Faker::Name.name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end