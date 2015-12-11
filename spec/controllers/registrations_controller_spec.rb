require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  describe RegistrationsController do
    describe "POST #create" do
      context "with valid attributes" do
        it "creates the user" do
          post :create, user: FactoryGirl.create(:user) 
          expect(User.count).to eq(1)
        end
     end

     context "with invalid attributes" do
      it "does not create the user" do
        post :create, user: attributes_for(:user, email: nil)
        expect(User.count).to eq(0)
      end
     end
   end


  #  context "DELETE #destroy" do
  #   it "deletes a user" do
  #     delete :destroy, user: FactoryGirl.destroy(:user)
  #     expect(User.count).to eq(0) 
  #   end
  #  end
   end
end
