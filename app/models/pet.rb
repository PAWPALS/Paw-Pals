class Pet < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :breed, :age, :description


  has_attached_file :avatar 
  # validates :avatar, attachment_presence: true
  validates_attachment_file_name :avatar, matches: [ /gif\Z/,
    /jpg\Z/, /jpeg\Z/, /png\Z/, /jif\Z/, /jfif\Z/]
end

