source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-rails'
  gem "rails-bootstrap-helpers"
  gem 'bootstrap-sass', '~> 2.3.2.1'
end

gem 'jquery-rails'
gem 'clearance'
gem 'thin'
gem 'high_voltage'
gem 'paperclip'
gem 'formtastic'
gem 'flutie'
gem 'bourbon'
gem 'airbrake'
gem 'neat'
gem 'spinjs-rails'
gem 'js-routes'
gem 'nokogiri'

gem 'resque', :require => 'resque/server'
gem 'resque-scheduler', :require => 'resque_scheduler'

gem 'underscore-rails'

group :development do
  gem 'foreman'
end

group :development, :test do
  gem 'guard'
  gem 'guard-spork'
  gem 'rspec-rails'
  gem 'sham_rack'
end

group :test do
  gem 'sqlite3'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'poltergeist'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'bourne'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'simplecov', require: false
end

group :staging, :production do
  gem 'newrelic_rpm'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
