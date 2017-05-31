class ApplicationMailer < ActionMailer::Base
if Rails.env.production?
  default from: "noreply@eats.com"
else
  default from: "federico.kunze94@gmail.com"
end
  layout 'mailer'
end
