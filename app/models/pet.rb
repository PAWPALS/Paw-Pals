class Pet < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :breed, :age, :description, :present 

  has_attached_file :avatar 
  validates :avatar, avatar_presence: true
  validates_attachment_file_name :gift, matches: [ /gif\Z/,
    /jpg\Z/, /jpeg\Z/, /png\Z/, /jif\Z/, /jfif\Z/]
end

