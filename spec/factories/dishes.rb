FactoryGirl.define do
  factory :dish do
    title { Faker::Lorem.sentence }
    review { Faker::Lorem.sentence }
    experience
    venue
  end

end