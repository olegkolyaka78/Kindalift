class CreateEventTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :event_tasks do |t|
      t.string :name
      t.datetime :datetime
      t.string :priority
      t.string :status
      #t.integer :event_id
      #t.integer :child_id
      #t.integer :caregiver_id
      #t.integer :address_id
      t.references :event, null: false, foreign_key: true
      t.references :child, null: false, foreign_key: true
      t.references :caregiver, null: true, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
