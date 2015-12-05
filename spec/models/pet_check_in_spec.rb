require 'rails_helper'

RSpec.describe PetCheckIn, type: :model do
  
  describe PetCheckIn do 
    it "has valid factory" do
    expect(build(:pet_check_in)).to be_valid
  end

  it "is invalid without latitude" do
    expect(build(:pet_check_in, latitude: nil)).to_not be_valid
  end

  it "is invalid without longitude" do
    expect(build(:pet_check_in, longitude: nil)).to_not be_valid
  end

  it "is invalid without pet_id" do
    expect(build(:pet_check_in, pet_id: nil)).to_not be_valid
  end

    it {should belong_to(:pet)}
 end
end
