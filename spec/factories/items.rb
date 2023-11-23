FactoryBot.define do
  factory :item do
    name { Faker::Name.unique.name }
    introduction { Faker::Lorem.paragraph(sentence_count: 5) } 
    category { Category.all.sample } 
    condition { Condition.all.sample }
    postage_payer { PostagePayer.all.sample }
    preparation_day { PreparationDay.all.sample }
    prefecture { Prefecture.all.sample }
    price { Faker::Number.between(from: 300, to: 9999999) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end