class AddColumnPets < ActiveRecord::Migration
    def change
    add_column :pets, :last_checkin_time, :datetime, null: false 
  end
end
