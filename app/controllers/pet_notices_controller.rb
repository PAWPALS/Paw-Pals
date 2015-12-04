class PetNoticesController < ApplicationController 


  def create 
    @pet_notice = PetNotice.new(longitude: params[:longitude], 
                                latitude: params[:latitude],
                                pet_id: params[:pet_id])
    if @pet_notice.save 
      render "create.json.jbuilder", status: :created
    else
      render json: {errors: @pet_notice.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    @pet_notice = PetNotice.where(pet_id: params[:pet_id]).last
    render "show.json.jbuilder", status: :accepted
  end

  def index
    @pet_notices = PetNotice.where(pet_id: params[:pet_id])
    render "index.json.jbuilder", status: :accepted 
  end

end