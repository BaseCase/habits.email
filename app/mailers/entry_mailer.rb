class EntryMailer < ApplicationMailer
  def daily_entry_email(entry)
    @entry = entry
    mail to: @entry.habit.email,
         subject: "Daily check-in for #{@entry.habit.habit_name}"
  end
end
