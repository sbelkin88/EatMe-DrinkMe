FactoryGirl.define do
  factory :experience do
    name { Faker::Lorem.sentence }
    user
  end
end