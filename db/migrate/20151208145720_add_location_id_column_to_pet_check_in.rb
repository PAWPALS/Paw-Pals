class AddLocationIdColumnToPetCheckIn < ActiveRecord::Migration
  def change
    add_column :pet_check_ins, :location_id, :integer, null: false 
  end
end
