class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name
      #t.integer :event_id
      #t.integer :child_id
      #t.integer :caregiver_id
      #t.integer :event_task_id
      t.references :event, null: false, foreign_key: true
      t.references :child, null: false, foreign_key: true
      t.references :caregiver, null: false, foreign_key: true
      t.references :event_task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
