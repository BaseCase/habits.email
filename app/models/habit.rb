class Habit < ApplicationRecord
  validates :habit_name, :user_name, :email, presence: true
end
