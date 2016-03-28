require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Watercontrol
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  #  config.action_dispatch.default_headers.merge!({
  #    'Access-Control-Allow-Origin' => '*',
  #    'Access-Control-Request-Method' => '*',
  #    'Access-Control-Allow-Methods' => 'POST, PUT, DELETE, GET, OPTIONS',
  #    'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept, Authorization,
  #                                       X-HTTP-Method-Override'})

    config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
        allow do
          #En produccion se debe parametrizar la ip del servidor que aloja la app cliente
          origins '*'

          resource '/api',
            :headers => :any,
            :methods => [:post],
            :credentials => false,
            :max_age => 0

            resource '*',
            :headers => :any,
            :methods => [:get, :post, :delete, :put, :patch, :options, :head],
            :max_age => 0
          end
        end
  end
  Rails.application.routes.default_url_options = { host: 'example.com' }
end
