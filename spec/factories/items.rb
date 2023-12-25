FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name             {Faker::Name.name}
    content          {Faker::Lorem.sentence}
    category         {Category.all.sample}
    condition        {Condition.all.sample}
    delivery_cost    {DeliveryCost.all.sample}
    prefecture       {Prefecture.all.sample}
    post_day         {PostDay.all.sample}
    price            {Faker::Number.between(from: 300, to: 9_999_999)}

    association :user

  end
end