class ChangeColumnChildNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :addresses, :child_id, true
  end
end
