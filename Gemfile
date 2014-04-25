source 'https://rubygems.org'

#=====================================================
#
# Gems REQUIRED by the rails app (always loaded)
#
#=====================================================

gem 'rails', '3.2.17'
gem 'rack', '1.4.5'
gem 'mysql2', '0.3.13'
gem 'yajl-ruby', '1.1.0', :require => 'yajl'
gem 'jammit', '0.6.5'
gem 'geoip', '0.8.6'

gem 'mongo',    '1.8.5'
gem 'bson',     '1.8.5'
gem 'bson_ext', '1.8.5'

gem 'mongo_mapper', '0.12.0'

# Use MongoDB to store sessions (see: https://github.com/brianhempel/mongo_session_store)
#
#   -> there are a bunch of "mongo_session_store" gems out there (see github forks...)
#   -> but we picked this one because at least it seemed to be maintained.
#
gem 'mongo_session_store-rails3', '3.0.6'

# latest version compatible with 1.8.7 and 2.0.0
# switch to newest when only running on 2.0.0
gem 'nokogiri', '1.5.10'

gem 'delayed_job_active_record', '0.3.3'
gem 'delayed_job', '3.0.3'

gem 'omniauth', '1.1.4'
gem 'omniauth-oauth', '1.0.1'
gem 'omniauth-facebook', '1.4.1'


gem 'globalize3', '0.2.0'
gem 'RedCloth', '4.2.9'
gem 'i18n-country-translations', '1.0.1'
gem 'easy_translatable', '0.3.1', :require => 'translatable'

gem "rdoc", '3.12' # dependency of railties (~> 3.4), we lock the version

gem 'newrelic_rpm', '3.7.2.192', :groups => [:preprod, :alpha, :beta, :production]

# Unicorn (uncomment the following line and bundle install to use unicorn)
# gem 'unicorn', '4.6.3'

# Payment
gem 'omnipay', '~> 0.1.0'

#=====================================================
#
# Gems REQUIRED by the rails app (loaded when needed)
#
#    -> not loaded at the app boot-up, so much faster rails boot-up
#    -> see http://alexyoung.org/2009/07/03/rapid-rails-boot-up-time/
#    -> see "autoload" directives in config/initializers/extra_config.rb,
#       and "require" or "autoload" directives in files that use the libs
#
#=====================================================

gem 'aws-sdk',   '1.33.0', :require => false
gem 'icalendar', '1.1.5', :require => false
gem 'holidays', :tag => 'v1.0.6', :git => 'https://github.com/clicrdv/holidays.git', :require => false
gem 'countries', '0.8.3', :require => false
gem 'prawn',     '0.12.0', :require => false
gem 'rforce',    '0.11',   :require => false


gem 'spreadsheet', '0.7.6', :require => false # TODO : use gem 'writeexcel' instead
gem 'writeexcel',  '1.0.2', :require => false

# gem to manage translations (required in an initializer)
gem 'localeapp',  '0.6.12', :require => false, :groups => [:development, :preprod, :alpha, :beta]

# gem used for SendGrind API
gem 'sendgrid_toolkit', '>= 1.1.1', :require => false

# Force httparty version, last compatible version for Ruby 1.8.7
gem 'httparty',         '0.11.0', :require => false
#=====================================================
#
# Gems NEEDED for external scripts
#
#   -> never need to require them in the rails app
#
#=====================================================

gem 'rake', '0.9.2.2', :require => false

# gem for tasks run via a terminal
gem 'highline', '1.6.19', :require => false

# NEVER require god in the rails project
#   -> https://github.com/mojombo/god/issues/17
#   -> https://github.com/clicrdv/clicrdv/commit/cc670e5
gem 'god', '0.13.3', :require => false

# gems needed to build files
gem 'sass',       '3.2.7',  :require => false, :groups => [:development, :preprod, :alpha, :beta]
gem 'compass',    '0.12.2', :require => false, :groups => [:development, :preprod, :alpha, :beta]
gem 'rb-fsevent', '0.9.3',  :require => false, :groups => [:development, :preprod, :alpha, :beta]

# gems used by deployment scripts
gem 'capistrano', '2.14.2', :require => false, :groups => [:preprod, :alpha, :beta]


#=====================================================
#
# Business logic currently being extracted into gems
# WARNING: put all the local gems in this group :local
# WARNING2: We don't have any mechanism to differentiate local_prod, local_preprod
#           local_test for the moment, so all gems here are for production env too
#
#=====================================================
group :local do
  gem 'salesforce_adapter', :path => 'gems/salesforce_adapter'
  gem 'salesforce_model',   :path => 'gems/salesforce_model'
  gem 'yui_combo_loader',    :path => 'gems/yui_combo_loader'
end


#=====================================================
#
# DEV or TEST-only gems
#
#=====================================================

group :development do
  gem 'pry', '~> 0.9'
  gem 'pry-debugger', '~> 0.2.2'
  gem 'pry-stack_explorer', '~> 0.4.9'
end

group :test do
  # bundler requires these gems while running tests
  # gem 'rspec'
  # gem 'faker'
  
  gem 'ci_reporter',        '1.7.3' # 1.6.2 min
  gem 'timecop',            '0.3.5',  :require => 'timecop'
  gem 'factory_girl_rails', '1.7.0'
  gem 'simplecov',          '0.7.1',  :require => false
  gem 'mocha',              '0.14',   :require => false # Mocha 0.13+ compatible with rails 3.2.13+
  gem 'vcr',                '2.8.0',  :require => false
  gem 'webmock',            '1.16.0', :require => false #VCR dependency

  gem 'codeclimate-test-reporter', '0.1.1', :require => false
end
