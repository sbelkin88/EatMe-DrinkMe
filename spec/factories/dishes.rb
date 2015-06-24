FactoryGirl.define do
  factory :dish do
    title { Faker::Lorem.sentence }
    review { Faker::Lorem.sentence }
    association :venue, :experience
  end

end