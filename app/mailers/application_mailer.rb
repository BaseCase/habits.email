class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@habits.email'
  layout 'mailer'
end
