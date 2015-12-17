class PetCheckinsController < ApplicationController
  before_action :authenticate_user!

  def show
    @pet = Pet.find(params[:id])
    @pet.sync_from_api
    @checkins = @pet.pet_check_ins.order(adafruit_created_at: :desc).last(5)
      render "pet_checkin_show.json.jbuilder", status: :accepted
  end
end


