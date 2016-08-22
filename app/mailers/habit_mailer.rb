class HabitMailer < ApplicationMailer
  def confirmation_email(habit)
    @habit = habit
    mail to: @habit.email,
         subject: "Confirm your daily habit"
  end
end
