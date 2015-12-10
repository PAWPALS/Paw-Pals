class AddNullFalsePetsPresent < ActiveRecord::Migration
  def change
    change_column :pets, :present, :boolean, :null => false
  end
end
