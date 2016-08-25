class SendDailyCheckInEmailsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    today = Date.today
    logger.debug "About to send out daily emails for #{today}!"

    habits = Habit.where(active: true)

    habits.each do |habit|
      entry = habit.entries.create(for_date: today)
      logger.debug "Sending email to #{habit.user_name} about #{habit.habit_name}..."
      EntryMailer.daily_entry_email(entry).deliver_later
    end

    logger.debug "Done with the daily emails for #{today}!"
  end
end
