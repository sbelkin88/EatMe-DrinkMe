FactoryGirl.define do
  factory :venue do
    name { Faker::Lorem.sentence }
    address { Faker::Lorem.sentence }
    city { Faker::Lorem.word }
    state { Faker::Lorem.word }
    zip { Faker::Lorem.word }
    phone { Faker::Lorem.word }
    website { Faker::Lorem.word }
  end
end