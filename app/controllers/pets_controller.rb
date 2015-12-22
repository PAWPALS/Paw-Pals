class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @pet.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def index
    @pets = Pet.all
    render "index.json.jbuilder", status: :accepted 
  end

  def users_index
    @pets = Pet.where(user_id: params[:id])
    render "users_index.json.jbuilder", status: :accepted
  end


  def show
     @pet = Pet.find(params[:pet_id])
    render "show.json.jbuilder", status: :accepted 
  end

  def destroy
    @pet = Pet.find(params[:pet_id])
     if @pet && current_user.id == @pet.user_id
      @pet.destroy
      render json: {success: "Pet delete successful!"}, status: :accepted 
    else    
     render json: { error: "Unable to delete the pet." },    
            status: :unauthorized   
    end
  end

  def update
   @pet = Pet.find(params[:pet_id])
    if @pet && current_user.id == @pet.user_id
     @pet.update(update_params)
     render json: {success: "Pet status and or picture update successful!"}, status: :accepted
    else
      render json: { error: "Unable to edit pets status and or picture." },    
            status: :unauthorized   
    end
  end

  private
  def pet_params
    params.permit(:name, :breed, :age, :description, :present, {avatar: [:picture]}, :mobile_url).merge(user_id: current_user.id)
  end

  def update_params
    params.permit(:present, {avatar: [:picture]})
  end
end




