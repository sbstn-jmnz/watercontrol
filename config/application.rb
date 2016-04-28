require File.expand_path('../boot', __FILE__)
require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Watercontrol
  Rails.application.routes.default_url_options = { host: 'example.com' }
  Rails.application.config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]

  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
        allow do
          #En produccion se debe parametrizar la ip del servidor que aloja la app cliente
          origins '*'
          resource '/api',
            :headers => :any,
            :methods => [:post, :patch],
            :credentials => false,
            :max_age => 0

          resource '*',
            :headers => :any,
            :methods => [:get, :post, :delete, :put, :patch, :options, :head],
            :max_age => 0
          end
        end
      end
end
