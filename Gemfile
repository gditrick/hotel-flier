source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'
#gem 'railties'

# Hosting
gem 'unicorn'             # HTTP Server

# Data store
gem 'pg'                  # Database
#gem 'pg_array_parser'     # heavy lifting for parsing postgres arrays

# Use sequel ORM
#gem 'sequel'
gem 'sequel-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
#gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
#gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Authentication and Authorization
gem 'devise', '~> 3.0.0'                                        # User authentication
gem 'devise_sequel'
gem 'cancan'

# Diagnostics
gem 'newrelic_rpm'        # New Relic agent

# Misc.
#gem 'paperclip'           # File uploads
gem 'prawn'               # PDF generation
gem 'resque', require: 'resque/server'
gem 'possessive'
gem 'rb_wunderground'
#gem 'linux_fortune'


# Test environment
group :test do
  gem 'spork'
  gem 'capybara'
  gem 'forgery'
  gem 'launchy'
  gem 'database_cleaner'
end

# Development environment
group :development do
  gem 'unicorn-rails'      # Makes unicorn the default server for "rails s"
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'pry'
  gem 'pry-debugger' # Use pry debugger
end

# Testing suite
group :test, :development do
  gem 'rspec-rails'
  gem 'rspec-given'
  gem 'factory_girl_rails'
  gem 'lunchy'
  gem 'dotenv-rails'
end
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
