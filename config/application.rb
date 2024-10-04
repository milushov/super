# frozen_string_literal: true

require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Super
  class Application < Rails::Application
    config.load_defaults 7.1
    # config.autoloader = :zeitwerk
    config.generators.system_tests = nil
    config.app_config = config_for(:app_config)
    config.i18n.available_locales = [:en, :ru, :uk]

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins_arr = ['http://localhost:3001', 'https://super.wheres.me', ("https://#{ENV['NGROK_DOMAIN']}" if ENV.key?('NGROK_DOMAIN'))]
        origins *origins_arr.compact
        resource '*', 
          headers: :any, 
          methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end

    config.paths.add 'app/decorators', eager_load: true
    config.autoload_paths += %W(#{config.root}/app/errors)
  end
end
