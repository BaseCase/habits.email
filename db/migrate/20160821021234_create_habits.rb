class CreateHabits < ActiveRecord::Migration[5.0]
  def change
    self.execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'

    create_table :habits, id: :uuid do |t|
      t.string :habit_name, null: false
      t.string :user_name, null: false
      t.string :email, index: true, null: false
      t.boolean :active, index: true, null: false, default: false

      t.timestamps
    end
  end
end
