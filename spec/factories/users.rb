FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password123' }
    password_confirmation { 'password123' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { '2000-01-01' }
  end
end
