class PetNoticesController < ApplicationController 
  before_action :authenticate_user!, only: [:create]


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

  def index_all_lost
    @pets = Pet.where(present: "no")
    @users = @pets.pluck(:user_id)
    @addresses = Address.where(user_id: @users)
    render "all_lost_index.json.jbuilder", status: :accepted
  end

end