FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}

    transient do
      person {Gimei.name}
    end

    last_name             {person.last}
    first_name            {person.first}
    last_name_kana        {person.last.katakana}
    first_name_kana       {person.first.katakana}
    birth                 {Faker::Date.birthday}
  end
end