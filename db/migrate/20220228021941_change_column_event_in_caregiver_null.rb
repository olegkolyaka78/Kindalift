class ChangeColumnEventInCaregiverNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :caregivers, :event_id, true
  end
end
