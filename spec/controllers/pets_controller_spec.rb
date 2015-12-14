require 'rails_helper'

RSpec.describe PetsController, type: :controller do

      
      context "POST #create" do

        let(:user) { FactoryGirl.create(:user) }
        before(:each) do
        allow(controller).to receive(:current_user).and_return(user) 
      end

      it "creates pet in the database with valid attributes and sends status created" do
      params = FactoryGirl.attributes_for(:pet) 
      post :create, params 
      expect(Pet.count).to eq(1)
      expect(response).to have_http_status(201)
      expect(response).to render_template("pets/create.json.jbuilder")
    end

    it "does not create pet in the database with invalid attributes and sends status unprocessable" do
      params = FactoryGirl.attributes_for(:pet, name: nil)
      post :create, params
      expect(Pet.count).to eq(0)
      expect(response).to have_http_status(422)
    end
  end
end
