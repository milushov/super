# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: '.ruby-version'

# Bundle edge Rails instead:
# gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.5"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.3"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 5.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sassc-rails", "~> 2.1"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

gem "brakeman"
gem "bundler-audit"
gem "rubocop-rails"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", "1.8.0", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "rubocop-rspec"
  gem "pry-rails"
  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem "foreman"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "super_diff"
end

gem "sidekiq", "~> 7.1", ">= 7.1.2"
gem "sidekiq-cron", "~> 1.10"
gem "sidekiq-unique-jobs"
gem "awesome_print"
gem "telegram-bot-ruby"
gem "ruby-openai", "~> 4.2"
gem "devise"

# https://tailwindcss.com/docs/guides/ruby-on-rails
gem "tailwindcss-rails", "~> 2.0"
gem "jsbundling-rails"

gem "dry-monads", "~> 1.6"
gem "dry-schema", "~> 1.13", ">= 1.13.2"
gem "dry-struct", "~> 1.6"
gem "dry-validation", "~> 1.10"
gem "activeadmin", "~> 3.0"
gem "rack-cors", require: "rack/cors"
gem 'httparty'
gem 'jwt'
