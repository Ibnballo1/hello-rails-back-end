require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HelloRailsBackEnd
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        # origins '*'  # Update this to the domain(s) you want to allow requests from
        origins 'localhost:3000'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :delete, :options, :head],
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'] # Update this to expose any custom headers that your app uses
      end
    end
  end
end
