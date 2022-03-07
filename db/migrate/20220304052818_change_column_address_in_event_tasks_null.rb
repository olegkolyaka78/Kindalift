class ChangeColumnAddressInEventTasksNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :event_tasks, :address_id, true
  end
end
