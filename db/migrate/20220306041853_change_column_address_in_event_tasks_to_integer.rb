class ChangeColumnAddressInEventTasksToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :event_tasks, :pickup_address, :integer
    change_column :event_tasks, :dropoff_address, :integer
  end
end
