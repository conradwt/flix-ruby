source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.0', '>= 8.0.2.1'
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem 'propshaft', '~> 1.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5', '>= 1.5.3'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.6.0'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails', '~> 2.0', '>= 2.0.1'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails', '~> 2.0', '>= 2.0.13'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails', '~> 1.3', '>= 1.3.4'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder', '~> 2.13'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1', '>= 3.1.20'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2025', '>= 1.2025.2', platforms: %i[windows jruby]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem 'solid_cache', '~> 1.0', '>= 1.0.7'
gem 'solid_queue', '~> 1.1', '>= 1.1.4'
gem 'solid_cable', '~> 3.0', '>= 3.0.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.18', '>= 1.18.4', require: false

# Use Sass to process CSS
gem 'dartsass-rails', '~> 0.5.0'

# Use Tailwind CSS
gem "tailwindcss-rails", "~> 4.3.0"

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem 'kamal', '~> 2.5', '>= 2.5.3', require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem 'thruster', '~> 0.1.12', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'aws-sdk-s3', '~> 1.199', require: false
gem 'image_processing', '~> 1.12', '>= 1.12.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', '~> 1.10', platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', '~> 7.0', '>= 7.0.2', require: false

  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.4'

  gem 'rexml', '~> 3.4', '>= 3.4.1'
  gem 'rspec-rails', '~> 8.0'

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'rubocop-rails-omakase', '~> 1.1', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console', '~> 4.2', '>= 4.2.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.40'

  gem 'selenium-webdriver', '~> 4.34'
end
