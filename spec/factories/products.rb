FactoryBot.define do
  factory :product do
    name { 'テスト' }
    explanation { 'テスト' }
    category_id { 2 }
    status_id { 2 }
    shipping_fee_id { 2 }
    shipping_origin_id { 2 }
    shipping_price_id { 2 }
    selling_price { 500 }
    # association :user
    user { create(:user) }
  end
end
