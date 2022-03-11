class ChangeColumnCaregiverInChildrenNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :children, :caregiver_id, true
  end
end
