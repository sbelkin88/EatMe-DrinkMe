FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
    email 'test1@gmail.com'
    password 'asdfasdf'
    password_confirmation {password}
  end

end