class ChangeColumnEventTaskInChildrenNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :children, :event_task_id, true
  end
end
