namespace :entries do
  desc "Sends out all daily check-in emails for active habits and creates corresponding Entries in the db"
  task send_daily_emails: :environment do
    SendDailyCheckInEmailsJob.perform_later
  end
end
