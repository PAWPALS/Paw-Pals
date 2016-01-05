require 'rails_helper'

RSpec.describe PetsController, type: :controller do

    describe PetsController do
      it {should use_before_action(:authenticate_user!)}
    end
      

      let(:user) { FactoryGirl.create(:user) }
      before(:each) do
      allow(controller).to receive(:current_user).and_return(user) 
    end

    describe "POST #create" do

    it "allows logged in user to create pet" do
      params = FactoryGirl.attributes_for(:pet) 
      post :create, params 
      expect(Pet.count).to eq(1)
      expect(response).to have_http_status(201)
      expect(response).to render_template("pets/create.json.jbuilder")
    end

    it "does not allow logged in user to create pet" do
      params = FactoryGirl.attributes_for(:pet, name: nil)
      post :create, params
      expect(Pet.count).to eq(0)
      expect(response).to have_http_status(422)
      expect(response.content_type).to eq("application/json")
    end
  end

    describe "GET #index" do 

    it "creates a resource" do
      get :index 
      expect(response).to have_http_status(202)
      expect(response.content_type).to eq("application/json")
      expect(response).to render_template("pets/index.json.jbuilder")
    end
  end

  describe "GET #users_index" do

    it "creates a resource" do
      get :users_index, id: 8
      expect(response).to have_http_status(202)
      expect(response.content_type).to eq("application/json")
      expect(response).to render_template("pets/users_index.json.jbuilder")
    end
  end

  describe "GET #show" do

    it "creates a resource" do
      pet = FactoryGirl.attributes_for(:pet, pet_id: 7)
      get :show, pet
      # expect(response).to have_http_status(202)
      expect(response.content_type).to eq("application/json")
      # expect(response).to render_template("pets/show.json.jbuilder")
    end
  end

  describe "DELETE #destroy" do

    it "allows pet to be deleted" do
      pet = FactoryGirl.attributes_for(:pet, pet_id: 7)
      delete :destroy, pet
      # expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "PUT #update" do   # needs work 

    before (:each) do
      @pet = FactoryGirl.attributes_for(:pet)
    end

    it "allows pet to be updated" do
      put :update, :pet_id => @pet, :pet => @pet = {:name => "bilbo"}
      expect(response.content_type).to eq("application/json")
    end
  end
end








