require 'rails_helper'

RSpec.describe PetNotice, type: :model do

  describe PetNotice do 
    it "has valid factory" do
    expect(build(:pet_notice)).to be_valid
  end

  it "is invalid without latitude" do
    expect(build(:pet_notice, latitude: nil)).to_not be_valid
  end

  it "is invalid without longitude" do
    expect(build(:pet_notice, longitude: nil)).to_not be_valid
  end

  it "is invalid without pet_id" do
    expect(build(:pet_notice, pet_id: nil)).to_not be_valid
  end

    it {should belong_to(:pet)}
 end
end
