class CreatePetNotices < ActiveRecord::Migration
  def change
    create_table :pet_notices do |t|
      t.integer :pet_id, null: false 
      t.decimal :longitude, null: false
      t.decimal :latitude, null: false 

      t.timestamps null: false
    end
  end
end
