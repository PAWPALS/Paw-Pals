require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

    context "POST #create" do

    it "sends status created when user successfully created" do
      params = FactoryGirl.attributes_for(:user)
      post :create, params
      expect(response).to have_http_status(201)
    end

    it "sends status unprocessable entity when user not successfully created" do
      params = FactoryGirl.attributes_for(:user, email: nil)
      post :create, params
      expect(response).to have_http_status(422) 
    end 

      
    it "creates user in the database with valid attributes" do
      params = FactoryGirl.attributes_for(:user)  
      post :create, params 
      expect(User.count).to eq(1)
    end

    it "does not create user in the database with invalid attributes" do
      params = FactoryGirl.attributes_for(:user, email: nil)
      post :create, params
      expect(User.count).to eq(0)
    end

    context "POST #login" do

    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
    allow(controller).to receive(:current_user).and_return(user) 
    end

      it "sends status ok with proper params login" do
        params = FactoryGirl.attributes_for(:user)
        post :login, params
        expect(response).to have_http_status(200) 
      end

      it "sends status unauthorized with improper params login" do
        params = FactoryGirl.attributes_for(:user, password: nil)
        post :login, params
        expect(response).to have_http_status(401) 
      end


      it "allow to user login with proper params" do
        params = FactoryGirl.attributes_for(:user)
        post :login, params
      end

      it "does not alllow user to login with improper params" do
        params = FactoryGirl.attributes_for(:user, email: nil)
        post :login, params 
    end

    context "DELETE #destroy" do

      it "sends status ok with proper params destroy account" do
        params = FactoryGirl.attributes_for(:user)
        delete :destroy, params
        expect(response).to have_http_status(200) 
    end

    it "sends status unauthorized with improper params delete account" do
        params = FactoryGirl.attributes_for(:user, password: nil)
        delete :destroy, params
        expect(response).to have_http_status(401) 
      end

      it "allow user to delete account with proper params" do
        params = FactoryGirl.attributes_for(:user)
        delete :destroy, params 
      end

      it " does not allow user to delete account with improper params" do
        params = FactoryGirl.attributes_for(:user, password: nil)
        delete :destroy, params 
      end
   end
  end
 end
end






