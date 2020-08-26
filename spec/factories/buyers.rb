FactoryBot.define do
  factory :buyer do
    postal_code {'123-4567'}
    prefectures_id {3}
    city {'テスト市'}
    address {'1-1'}
    building_name {'テストビル101'}
    phone_number {'09012345678'}
    association :order
  end
end
