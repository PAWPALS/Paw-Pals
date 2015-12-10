class AddColumnPetCheckIns < ActiveRecord::Migration
  def change
    add_column :pet_check_ins, :adafruit_created_at, :datetime, null: false 
  end
end
