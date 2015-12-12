class PetCheckinsController < ApplicationController
  before_action :authenticate_user!

  def show
    @pet = Pet.find_by!(params[:pet_id])
    if @pet.sync_from_api
      @pet_check_in = PetCheckIn.where(params[:pet_id]).last
       render "pet_checkin_show.json.jbuilder", status: :accepted
    else
      render json: {errors: @pet.errors.full_messages },
             status: :unprocessable_entity
    end
  end

   def index
    @pet = Pet.find_by!(params[:pet_id])
    if @pet.sync_from_api
      @pet_check_ins = PetCheckIn.where(params[:pet_id]).last(5)
    render "pet_checkin_index.json.jbuilder", status: :accepted 
  end
 end
end


