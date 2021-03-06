# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
# RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

# Get the SMTP password for ActionMailer
require File.join(File.dirname(__FILE__), 'smtp_pw')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = "Pacific Time (US & Canada)"

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
  config.action_controller.relative_url_root = '/research'
  
  # ActionMailer config for Gmail
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {      # FIXME please
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'localhost',
    :user_name            => 'ucbresearchmatch@gmail.com',
    :password             => @@smtp_pw,
    :authentication       => 'plain',
    :enable_starttls_auto => true  }


end

# This is the root url for our app (like localhost:3000/)
# WITH trailing slash
#
# DEPRECATED
#
#$rm_root = "http://upe.cs.berkeley.edu/research/"

# Set up ActionMailer
ActionMailer::Base.default_url_options[:host] = "upe.cs.berkeley.edu"   # /research is auto appended
ActionMailer::Base.default_content_type = "text/html"
# You can 'export ENABLE_ACTION_MAILER=true' or false to turn it on or off specifically.
ActionMailer::Base.delivery_method = (ENV['ENABLE_ACTION_MAILER'].present? && ActiveRecord::ConnectionAdapters::Column.value_to_boolean(ENV['ENABLE_ACTION_MAILER'])) ? :smtp : ({'development' => :test, 'test' => :test, 'production' => :smtp}[RAILS_ENV])
ActionMailer::Base.perform_deliveries = true  
puts "ActionMailer delivery method is #{ActionMailer::Base.delivery_method.to_s.upcase}"

# CAS authentication
CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => ({'development' => "https://auth-test.berkeley.edu/cas/",
                    'test'        => "https://auth-test.berkeley.edu/cas/",
                    'production'  => "https://auth.berkeley.edu/cas/"}[RAILS_ENV])
  #:cas_base_url => "https://auth.berkeley.edu/cas/"
)

# LDAP 
require 'ucb_ldap'
UCB::LDAP.host = ({'development' => 'ldap-test.berkeley.edu', 'test' => 'ldap-test.berkeley.edu', 'production' => 'ldap.berkeley.edu'}[RAILS_ENV])
UCB::LDAP.bind_for_rails() unless RAILS_ENV == 'test'
