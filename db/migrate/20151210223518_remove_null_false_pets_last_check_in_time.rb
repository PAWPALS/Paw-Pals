class RemoveNullFalsePetsLastCheckInTime < ActiveRecord::Migration
  def change
    change_column :pets, :last_checkin_time, :datetime, :null => true
  end
end
