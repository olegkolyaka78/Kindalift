class CreateCaregivers < ActiveRecord::Migration[6.1]
  def change
    create_table :caregivers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email
      #t.integer :event_id
      #t.integer :child_id
      #t.integer :address_id
      #t.integer :event_task_id
      t.references :event, null: false, foreign_key: true
      t.references :event_task, null: false, foreign_key: true
      t.references :child, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
