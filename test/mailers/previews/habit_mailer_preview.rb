class HabitMailerPreview < ActionMailer::Preview
  def confirmation_email
    HabitMailer.confirmation_email(Habit.last)
  end
end
