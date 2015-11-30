class CreatePetCheckIn < ActiveRecord::Migration
  def change
    create_table :pet_check_ins do |t|
      t.integer :pet_id, null: false 
      t.decimal :longitude, null: false
      t.decimal :latitude, null: false 

      t.timestamps null: false
    end
  end
end
