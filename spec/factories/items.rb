FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name                        { Faker::Lorem.sentence }
    description                 { Faker::Lorem.sentence }
    status_id                   { 2 }
    delivery_charge_defrayer_id { 2 }
    day_id                      { 2 }
    prefecture_id               { 2 }
    category_id                 { 2 }
    price                       { 777 }
    association :user
  end
end
