class PetCheckIn < ActiveRecord::Base
  belongs_to :pet

  validates_presence_of :longitude, :latitude, :pet_id, 
  :adafruit_created_at, :adafruit_id 
end



 