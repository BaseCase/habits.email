class AddConfirmationFlagAndTokenToHabits < ActiveRecord::Migration[5.0]
  def change
    add_column :habits, :confirmation_token, :string
    add_column :habits, :confirmed, :boolean, default: false
  end
end
