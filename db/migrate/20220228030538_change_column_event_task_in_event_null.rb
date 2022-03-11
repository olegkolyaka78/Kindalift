class ChangeColumnEventTaskInEventNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :events, :event_task_id, true
  end
end
