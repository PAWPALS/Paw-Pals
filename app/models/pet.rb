class Pet < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :breed, :age, :description, :present 
end

