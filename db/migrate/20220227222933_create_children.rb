class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      #t.integer :event_id
      #t.integer :caregiver_id
      #t.integer :address_id
      #t.integer :event_task_id
      t.references :event, null: false, foreign_key: true
      t.references :event_task, null: false, foreign_key: true
      t.references :caregiver, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
