class HabitMailer < ApplicationMailer
  def confirmation_email(habit)
    @habit = habit
    mail to: @habit.email,
         subject: "Confirm your new daily habit"
  end
end
