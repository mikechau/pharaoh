require File.expand_path('../boot', __FILE__)

require 'rails/all'

require File.dirname(__FILE__) + '/../lib/init/cloudflare_middleware.rb'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Pharaoh
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Rails 3 style dont enforce locales
    # http://stackoverflow.com/questions/20361428/rails-i18n-validation-deprecation-warning
    config.i18n.enforce_available_locales = false

    config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
      r301 %r{.*}, 'https://www.pharaoh.io$&',
        :if => Proc.new { |rack_env|
          rack_env['SERVER_NAME'] == 'pharaoh-io.herokuapp.com'
      }
    end

    config.middleware.insert_before(ActionDispatch::RemoteIp, Rack::CloudflareMiddleware)

    config.autoload_paths += %W(#{config.root}/lib/modules #{config.root}/lib/builders)

    # Enable memcached
    if ENV["MEMCACHEDCLOUD_SERVERS"]
      config.cache_store = :dalli_store, ENV['MEMCACHEDCLOUD_SERVERS'].split(','), { :username => ENV['MEMCACHEDCLOUD_USERNAME'], :password => ENV['MEMCACHEDCLOUD_PASSWORD'] }
    end

  end
end
