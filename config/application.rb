# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Futsalon
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.generators.template_engine = :slim
    config.load_defaults 5.1
    config.autoload_paths += %W[#{config.root}/lib #{config.root}/lib]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      # 色々な記述があるので、一番下に追記する
      g.test_framework :rspec,
                       fixtures: false,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false #,
                       #controller_specs: true,
                       #request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
