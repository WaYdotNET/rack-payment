# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # config.gem 'rack-payment'
  require Rails.root.join('..', '..', 'lib', 'rack-payment')
  config.time_zone = 'UTC'

  config.after_initialize do
     Rack::Payment.yml_file_names << Rails.root.join('config', 'rack-payment.yml')
    config.middleware.use Rack::Payment
  end
end
