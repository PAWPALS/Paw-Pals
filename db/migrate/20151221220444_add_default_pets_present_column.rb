class AddDefaultPetsPresentColumn < ActiveRecord::Migration
  def change
    change_column :pets, :present, :string, default: "yes"
  end
end
