FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    gimei = Gimei.name
    family_name {gimei.last.kanji}
    first_name {gimei.first.kanji}
    family_name_kana {gimei.last.katakana}
    first_name_kana {gimei.first.katakana}
    birthday {Faker::Date.birthday(min_age: 10, max_age: 80)}
  end
end