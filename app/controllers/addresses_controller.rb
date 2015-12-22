class AddressesController < ApplicationController 
  before_action :authenticate_user!, only: [:create, :destroy, :update]

  def create
    @address = Address.new(address: params[:street_address],
                  city: params[:city],
                  state: params[:state],
                  zip: params[:zip],
                  user_id: current_user.id)
    if @address.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @address.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def index
    @addresses = Address.all
    render "index.json.jbuilder", status: :accepted 
  end

   def users_address
    @address = Address.find_by!(user_id: params[:id])
    render "users_address.json.jbuilder", status: :accepted
  end

  def show
     @address = Address.find(params[:id])
    render "show.json.jbuilder", status: :accepted 
  end

  def destroy
    @address = Address.find(params[:id])
     if @address && current_user.id == @address.user_id
      @address.destroy
      render json: {success: "Address delete successful!"}, status: :accepted 
    else    
     render json: { error: "Unable to delete the address." },    
            status: :unauthorized   
    end
  end

  def update
   @address = Address.find(params[:id])
    if @address && current_user.id == @address.user_id
     @address.update(address: params[:street_address], city: params[:city], state: params[:state], zip: params[:zip])
     render "update.json.jbuilder", status: :accepted 
    else
      render json: { error: "Unable to edit address." },    
            status: :unauthorized   
    end
  end

  private
  def address_params   #keep getting Unpermitted parameter: street_address when trying to use?
    params.permit({address: [:street_address]}, :city, :state, :zip).merge(user_id: current_user.id)
  end

  def update_params 
    params.permit({address: [:street_address]}, :city, :state, :zip).merge(user_id: current_user.id)
  end
end








