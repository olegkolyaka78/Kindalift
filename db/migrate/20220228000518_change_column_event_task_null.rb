class ChangeColumnEventTaskNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :addresses, :event_task_id, true
  end
end
