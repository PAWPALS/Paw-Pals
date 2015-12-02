class Address < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :address, :city, :state, :zip
  validates_uniqueness_of :address
end