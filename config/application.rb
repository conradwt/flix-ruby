require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Flix
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # configure file generation for both application and specifications.
    config.generators do |g|
      g.helper false
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :rspec,
                        controller_specs: false,
                        fixture: false,
                        helper_specs: false,
                        routing_specs: false,
                        view_specs: false
      g.fixture_replacement :factory_bot
      g.fallbacks[:rspec] = :test_unit
      g.stylesheets     false
      g.javascripts     false
    end
  end
end
