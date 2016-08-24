class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    self.execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'

    create_table :entries, id: :uuid do |t|
      t.uuid :habit_id, index: true
      t.boolean :successful, null: false, default: false
      t.date :for_date, null: false

      t.timestamps
    end

    add_foreign_key :entries, :habits
  end
end
