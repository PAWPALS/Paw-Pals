class ChangePetPresentDataType < ActiveRecord::Migration
  def change
    change_column :pets, :present, :string 
    change_column_default :pets, :present, nil
  end
end
