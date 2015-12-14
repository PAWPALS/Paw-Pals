require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

    context "POST #create" do

      
    it "creates user in the database with valid attributes and sends status created" do
      params = FactoryGirl.attributes_for(:user) 
      post :create, params 
      expect(User.count).to eq(1)
      expect(response).to have_http_status(201)
      expect(response).to render_template("registrations/create.json.jbuilder")
    end

    it "does not create user in the database with invalid attributes and sends status unprocessable" do
      params = FactoryGirl.attributes_for(:user, email: nil)
      post :create, params
      expect(User.count).to eq(0)
      expect(response).to have_http_status(422)
    end

    context "POST #login" do

        let(:user) { FactoryGirl.create(:user) }
        before(:each) do
        allow(controller).to receive(:current_user).and_return(user) 
      end

      it "allow to user login with proper params and sends status ok" do
        params = FactoryGirl.attributes_for(:user)
        post :login, params
        expect(response).to have_http_status(200)
        expect(response).to render_template("registrations/login.json.jbuilder")  
      end

      it "does not alllow user to login with improper params and sends status unauthorized" do
        params = FactoryGirl.attributes_for(:user, password: nil)
        post :login, params
        expect(response).to have_http_status(401)  
     end

    context "DELETE #destroy" do

       it "allows user to delete account with proper params and sends status ok" do
        params = FactoryGirl.attributes_for(:user)
        delete :destroy, params 
        expect(response).to have_http_status(200) 
      end

      it " does not allow user to delete account with improper params and send status unauthorized" do
        params = FactoryGirl.attributes_for(:user, password: nil)
        delete :destroy, params 
         expect(response).to have_http_status(401) 
      end
   end
  end
 end
end






