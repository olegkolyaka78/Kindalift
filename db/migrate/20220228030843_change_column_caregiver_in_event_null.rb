class ChangeColumnCaregiverInEventNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :events, :caregiver_id, true
  end
end
