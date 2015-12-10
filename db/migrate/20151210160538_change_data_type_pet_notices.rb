class ChangeDataTypePetNotices < ActiveRecord::Migration
  change_table :pet_notices do |t|  
  t.change :longitude, :float 
  t.change :latitude, :float
end
end
