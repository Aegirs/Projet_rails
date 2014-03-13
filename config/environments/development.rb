<<<<<<< HEAD
Coloclify::Application.configure do
=======
Projet::Application.configure do
>>>>>>> 9e1b7cc9170d79e311352bdb51af80c736d9faf2
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
<<<<<<< HEAD

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

=======
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log
	
>>>>>>> 9e1b7cc9170d79e311352bdb51af80c736d9faf2
  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
<<<<<<< HEAD
=======
  config.assets.initialize_on_precompile = false
>>>>>>> 9e1b7cc9170d79e311352bdb51af80c736d9faf2
end
