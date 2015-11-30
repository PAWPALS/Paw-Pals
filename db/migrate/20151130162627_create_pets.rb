class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.integer :user_id, null: false 
      t.string :name, null: false
      t.string :breed, null: false 
      t.integer :age, null: false 
      t.string :description, null: false
      t.boolean :present, default: true, null: false
      
      t.timestamps null: false
    end
  end
end
