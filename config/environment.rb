# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :port           => Rails.application.credentials.mail[:port],
  :address        => Rails.application.credentials.mail[:server],
  :user_name      => Rails.application.credentials.mail[:login],
  :password       => Rails.application.credentials.mail[:password],
  :domain         => 'angelrails-photo-app.herokuapp.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
