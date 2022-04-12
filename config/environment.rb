# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.perform_deliveries = true

 ActionMailer::Base.delivery_method = :smtp

 ActionMailer::Base.smtp_settings = {
   :user_name => 'f13d2682955e54',
   :password => '4a5f6695c873a5',
   :address => 'smtp.mailtrap.io',
   :domain => 'smtp.mailtrap.io',
   :port => '2525',
   :authentication => :cram_md5
 }
