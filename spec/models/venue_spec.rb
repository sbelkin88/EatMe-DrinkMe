require 'rails_helper'

describe Venue do
  let(:venue) {FactoryGirl.build(:venue)}

  subject{ venue }
  it { should be_valid }

  it 'is invalid without a name' do
    venue2 = Venue.new(name: nil, address: "Broadway")
    venue2.valid?
    expect(venue2.errors[:name]).to include("can't be blank")
  end
end