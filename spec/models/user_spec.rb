require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe User do
    it "has a valid factory" do
    expect(build(:user)).to be_valid 
  end

  it "is invalid without without email" do
    expect(build(:user, email: nil)).to_not be_valid 
  end

  it "is invalid without without password" do
    expect(build(:user, password: nil)).to_not be_valid 
  end

  it {should have_secure_password}

  it {should have_many(:pets)}

  it {should have_one(:address)}
 end
end



 




