# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.5'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'

# Seeds
gem 'seed-fu'

# Model
gem 'active_hash'
gem 'enum_help'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# gem 'turbolinks'
gem 'meta-tags'
gem 'slim-rails'

# Assets
gem 'bootstrap-sass'
gem 'carrierwave'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'mini_magick'
gem 'mini_racer'
gem 'sassc'
# Use Sass to process CSS
gem 'sass-rails'
gem 'uglifier'

# Configuration
gem 'config'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'whenever', require: false

gem 'rails-i18n'

# Authentication
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
# Twitter認証
gem 'omniauth-twitter2'
# Google認証
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'

# Search
gem 'rails-autocomplete'
gem 'ransack'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Pagination
gem 'bootstrap'
gem 'bootstrap5-kaminari-views'
gem 'kaminari'
gem 'kaminari-i18n'

# Form
gem 'cocoon'
gem 'simple_form'

# Debugger
gem 'better_errors'
gem 'binding_of_caller'
gem 'byebug'
gem 'pry'
gem 'pry-byebug'
gem 'pry-doc'
gem 'pry-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'letter_opener_web'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console'
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'dockerfile-rails', '>= 1.6', group: :development

gem 'pg', '~> 1.5'
