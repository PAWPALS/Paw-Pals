class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :pet_check_ins, dependent: :destroy
  has_many :pet_notices, dependent: :destroy

  validates_presence_of :name, :breed, :age, :description


  has_attached_file :avatar 
  # validates :avatar, attachment_presence: true
  validates_attachment_file_name :avatar, matches: [ /gif\Z/,
    /jpg\Z/, /jpeg\Z/, /png\Z/, /jif\Z/, /jfif\Z/]
end

#   def sync_checkins
#     @api_data = AdafruitApi.sync_location
#     change this to use aio object from gem and ruby client
#     find by id in the controller and then call this method to find location info and parse/store
#   end


