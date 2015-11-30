class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false 
      t.string :address, null: false 
      t.string :city, null: false 
      t.string :state, null: false 
      t.integer :zip, null: false 

      t.timestamps null: false
    end
  end
end
