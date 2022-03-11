class ChangeColumnEventInChildrenNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :children, :event_id, true
  end
end
