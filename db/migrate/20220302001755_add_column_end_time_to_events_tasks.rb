class AddColumnEndTimeToEventsTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :event_tasks, :start_time, :datetime
  end
end