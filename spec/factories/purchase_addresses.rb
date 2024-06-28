FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    shipping_region_id { 1 }
    city { 'Test City' }
    address_line { 'Test Address' }
    building_name { 'Test Building' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
