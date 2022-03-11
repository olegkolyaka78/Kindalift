class RenameDatetimeToStartTime < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_tasks, :datetime, :end_time
  end
end
