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

  describe 'from_omniauth' do 
    it "should create a user from an oauth call" do 
      user_details = OmniAuth::AuthHash.new({provider: 'facebook', uid: '1', info: {name: 'mendel', email: 'mendel@mendel.com'}})
      user = User.from_omniauth(user_details)
      expect(user).to be_valid
    end

    it "should not create a user with invalid attr" do
      user_details = OmniAuth::AuthHash.new({ uid: '1', info: {name: 'mendel', email: 'mendel@mendel.com'}})
      user = User.from_omniauth(user_details)
      expect(user).not_to be_valid
    end
  end
end