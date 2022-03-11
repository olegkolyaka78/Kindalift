class ChangeColumnChildInCaregiverNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :caregivers, :child_id, true
  end
end
