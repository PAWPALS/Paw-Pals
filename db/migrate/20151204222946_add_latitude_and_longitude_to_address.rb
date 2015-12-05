class AddLatitudeAndLongitudeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :latitude, :float, null: false 
    add_column :addresses, :longitude, :float, null: false 
  end
end
