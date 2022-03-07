class ChangeColumnEventTaskInCaregiverNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :caregivers, :event_task_id, true
  end
end
