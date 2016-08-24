# Preview all emails at http://localhost:3000/rails/mailers/entry_mailer
class EntryMailerPreview < ActionMailer::Preview
  def daily_entry_email
    EntryMailer.daily_entry_email(Entry.last)
  end
end
