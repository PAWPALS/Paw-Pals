require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

    describe "POST #create" do

    it "creates user" do
      params = FactoryGirl.attributes_for(:user) 
      post :create, params 
      expect(User.count).to eq(1)
      expect(response).to have_http_status(201)
      expect(response).to render_template("registrations/create.json.jbuilder")
    end

    it "does not create user" do
      params = FactoryGirl.attributes_for(:user, email: nil)
      post :create, params
      expect(User.count).to eq(0)
      expect(response).to have_http_status(422)
      expect(response.content_type).to eq("application/json")
    end
  end

    describe "POST #login" do

        let(:user) { FactoryGirl.create(:user) }
        before(:each) do
        allow(controller).to receive(:current_user).and_return(user) 
      end

      it "allow to user login" do
        params = FactoryGirl.attributes_for(:user)
        post :login, params
        expect(response).to have_http_status(200)
        expect(response).to render_template("registrations/login.json.jbuilder")
        expect(response.content_type).to eq("application/json")  
      end

      it "does not allow user to login" do
        params = FactoryGirl.attributes_for(:user, password: nil)
        post :login, params
        expect(response).to have_http_status(401)
        expect(response.content_type).to eq("application/json")  
     end
    end

    describe "DELETE #destroy" do

        let(:user) { FactoryGirl.create(:user) }
        before(:each) do
        allow(controller).to receive(:current_user).and_return(user) 
      end

       it "allows user to be deleted" do
        params = FactoryGirl.attributes_for(:user)
        delete :destroy, params 
        expect(response).to have_http_status(200)
        expect(response.content_type).to eq("application/json") 
      end

      it "does not allow user to be deleted" do
        params = FactoryGirl.attributes_for(:user, password: nil)
        delete :destroy, params 
         expect(response).to have_http_status(401) 
         expect(response.content_type).to eq("application/json")
      end
   end
end






