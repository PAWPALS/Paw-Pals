class ChangeDataTypePetCheckIns < ActiveRecord::Migration
  change_table :pet_check_ins do |t|  
  t.change :longitude, :float 
  t.change :latitude, :float
 end
end
