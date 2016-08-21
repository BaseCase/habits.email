class Habit < ApplicationRecord
  validates :habit_name, :user_name, :email, presence: true
  has_secure_token :confirmation_token
end
