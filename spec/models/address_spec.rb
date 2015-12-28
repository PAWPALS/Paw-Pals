require 'rails_helper'

RSpec.describe Address, type: :model do

  describe Address do
    it "has a valid factory" do
    expect(build(:address)).to be_valid 
  end

  it "is invalid without without address" do
    expect(build(:address, address: nil)).to_not be_valid 
  end

  it "is invalid without without city" do
    expect(build(:address, city: nil)).to_not be_valid 
  end

  it "is invalid without without state" do
    expect(build(:address, state: nil)).to_not be_valid 
  end

  it "is invalid without without zip" do
    expect(build(:address, zip: nil)).to_not be_valid 
  end

  # it "is invalid without user id" do
  #   expect(build(:address, user_id: nil)).to_not be_valid
  # end

  # it "is invalid without without latitude" do
  #   expect(build(:address, latitude: nil)).to_not be_valid 
  # end

  # it "is invalid without without longitude" do
  #   expect(build(:address, longitude: nil)).to_not be_valid 
  # end

  it {should belong_to(:user)}
 end
end

