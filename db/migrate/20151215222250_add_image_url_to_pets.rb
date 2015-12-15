class AddImageUrlToPets < ActiveRecord::Migration
  def change
    add_column :pets, :mobile_url, :string
  end
end
