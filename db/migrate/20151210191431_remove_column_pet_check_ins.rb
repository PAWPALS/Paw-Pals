class RemoveColumnPetCheckIns < ActiveRecord::Migration
  def change
    remove_column :pet_check_ins, :location_id
  end
end
