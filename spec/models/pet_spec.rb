require 'rails_helper'

RSpec.describe Pet, type: :model do

  describe Pet do
    it 'has a valid factory' do 
      expect(build(:pet)).to be_valid 
  end

   it "is invalid without without name" do
    expect(build(:pet, name: nil)).to_not be_valid 
  end

  it "is invalid without without breed" do
    expect(build(:pet, breed: nil)).to_not be_valid 
  end

  it "is invalid without without age and description" do
    expect(build(:pet, age: nil, description: nil)).to_not be_valid 
  end

  it {should have_attached_file(:avatar)}

  it {should validate_attachment_content_type(:avatar).
     allowing("image/jpg", "image/jpeg", "image/png", "image/gif")}

  it {should validate_attachment_size(:avatar).
                  less_than(1.megabytes)}

  it {should belong_to(:user)}

  it {should have_many(:pet_check_ins)}

  it {should have_many(:pet_notices)}
 end
end
