class Address < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :address, :city, :state, :zip
  validates_uniqueness_of :address

  geocoded_by :address
  after_validation :geocode 

  def address
    [address, city, state, zip].compact.join(',')
  end
end