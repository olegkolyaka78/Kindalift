class ChangeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :addresses, :caregiver_id, true
  end
end
