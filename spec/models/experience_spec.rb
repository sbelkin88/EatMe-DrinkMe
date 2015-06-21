require 'rails_helper'

describe Experience do
  it 'is valid with name' do
    good_exp = Experience.new(name: 'test name')
    expect(good_exp).to be_valid
  end

end