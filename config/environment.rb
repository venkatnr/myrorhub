# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Myrorhub::Application.initialize!
config.action_mailer.raise_delivery_errors = false
	config.action_mailer.default_url_options = { :host => 'http://myrorhub.herokuapp.com' }
	config.action_mailer.perform_deliveries = true
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.raise_delivery_errors = true

config.action_mailer.smtp_settings = {
	:enable_starttls_auto => true,
	:address => "smtp.gmail.com",
	:port=>587,
	:domain => "gmail.com",
	:authentication => :login,
	:user_name => "redmine.logicmatter",
	:password => "redminematter",
}

