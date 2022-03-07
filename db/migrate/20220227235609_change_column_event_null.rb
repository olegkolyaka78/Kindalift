class ChangeColumnEventNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :addresses, :event_id, true
  end
end
