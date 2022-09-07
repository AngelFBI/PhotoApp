# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :port           => ENV['MAILGUN_SMTP_PORT'],
    :address        => ENV['MAILGUN_SMTP_SERVER'],
    :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
    :password       => ENV['MAILGUN_SMTP_PASSWORD'],
    :domain         => 'angelrails-photo-app.herokuapp.com',
    :authentication => :plain,
  }
else
  ActionMailer::Base.smtp_settings = {
    :port           => Rails.application.credentials.mail[:port],
    :address        => Rails.application.credentials.mail[:server],
    :user_name      => Rails.application.credentials.mail[:login],
    :password       => Rails.application.credentials.mail[:password],
    :domain         => 'angelrails-photo-app.herokuapp.com',
    :authentication => :plain,
  }
end

ActionMailer::Base.delivery_method = :smtp
