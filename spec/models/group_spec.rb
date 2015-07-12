require 'rails_helper'

describe Group do
  it "is valid with a name" do
    hall = Group.new(name: 'Kingdom Hall')
    expect(hall).to be_valid
  end

  it "is invalid without a name" do
    hall = Group.new(name: nil)
    hall.valid?
    expect(hall.errors[:name]).to include("can't be blank")
  end

end
