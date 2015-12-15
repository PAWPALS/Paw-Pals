class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :pet_check_ins, dependent: :destroy
  has_many :pet_notices, dependent: :destroy

  validates_presence_of :name, :breed, :age, :description


  has_attached_file :avatar, :styles => {thumb: '124x155>',
      small: '200x200>', medium: '400x500', mobile: '800x1000>'}
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  # validates :avatar, attachment_presence: true
  

  def sync_from_api
    api = AdafruitApi.new
    checkins = api.get_coordinates
    checkins.each do |checkin|
      self.pet_check_ins.create(longitude: checkin[:long], latitude: checkin[:lat],
                                adafruit_created_at: checkin[:time], adafruit_id: checkin[:id], pet_id: checkin[:pet_id])
    end
    result = self.pet_check_ins.order(adafruit_created_at: :desc).first
    adafruit_time_stamp = result.adafruit_created_at
    self.update(last_checkin_time: adafruit_time_stamp)
  end
end





    
   

