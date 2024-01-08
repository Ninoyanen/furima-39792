FactoryBot.define do
  factory :order_address do
    token          { 'tok_' + Faker::Alphanumeric.alphanumeric(number: 26) }
    postal_code    { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture     { Prefecture.all.sample }
    municipality   { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building       { Faker::Company.name }
    phone_num      { Faker::Number.leading_zero_number(digits: 11) }
  end 
end
