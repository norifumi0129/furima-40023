FactoryBot.define do
  factory :item do
    name { Faker::Name.unique.name }
    introduction { Faker::Lorem.paragraph(sentence_count: 5) }
    category_id { 2 }
    condition_id { 2 }
    postage_payer_id { 2 }
    preparation_day_id { 2 }
    prefecture_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user, factory: :user
  end
end
