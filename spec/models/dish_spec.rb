require 'rails_helper'

describe Dish do
  let(:dish) {FactoryGirl.build(:dish)}

  subject{ dish }
  it { should be_valid }

  it 'is invalid without a title' do
    dish2 = Dish.new(title: nil)
    dish2.valid?
    expect(dish2.errors[:title]).to include("can't be blank")
  end
end