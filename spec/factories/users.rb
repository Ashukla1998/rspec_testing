FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    surname { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    mobile { Faker::Number.unique.number(digits: 10)  }
    username { Faker::Alphanumeric.unique.alphanumeric(number: 10) }
    password { Faker::Internet.password+ ['@', '#', '$', '%', '&'].join('') }
    # password { Faker::Internet.password(min_length: 8, max_length: 20, mix_case: true, special_characters: true) }
  end
end
