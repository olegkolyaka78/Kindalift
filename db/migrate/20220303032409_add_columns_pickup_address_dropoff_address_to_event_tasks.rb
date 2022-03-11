class AddColumnsPickupAddressDropoffAddressToEventTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :event_tasks, :pickup_address, :string
    add_column :event_tasks, :dropoff_address, :string
  end
end
