require 'rails_helper'

describe User do
  it "User should be a unique user" do
    user_one = FactoryGirl.create(:user)
    user_two = User.create(username:user_one.username, email:user_one.email)
    expect(user_two.valid?).to eq (false)
  end
  it "is invalid without an email address"do
      user = User.create(email: nil )
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
  end


end