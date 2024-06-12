FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    category_id { 1 }
    condition_id { 1 }
    shipping_payer_id { 1 }
    shipping_region_id { 1 }
    shipping_day_id { 1 }
    price { 1 }
    user { nil }
  end
end
