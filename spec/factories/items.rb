FactoryBot.define do
  factory :item do
    
    name             { Faker::Name.initials(number: 2)}
    explanation      { Faker::Lorem.sentence}
    category_id      {2}
    condition_id     {2}
    delivery_fee_id  {2}
    prefecture_id    {2}
    delivery_date_id {2}
    price            { Faker::Number.number(3) }
    user # = association :user, factory: :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/star.png'), filename: 'star.png')
    end

  end

end
