class RemoveNullFalsePetsPresent < ActiveRecord::Migration
  def change
    change_column :pets, :present, :boolean, :null => true
  end
end
