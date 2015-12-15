class AddAdafruitIdToPetCheckIns < ActiveRecord::Migration
  def change
    add_column :pet_check_ins, :adafruit_id, :integer, null: false 
  end
end
