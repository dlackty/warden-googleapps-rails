module Warden
  module GoogleApps
    module Rails
      class Railtie < ::Rails::Railtie
        initializer 'warden-googleapps-rails.warden' do |app|
          app.config.middleware.use Warden::Manager do |config|
            setup_default_strategies(config)
            setup_failure_app(config)
          end
        end

        initializer 'warden-googleapps-rails.helpers' do
          ActiveSupport.on_load(:action_controller) do
            include ControllerHelpers
          end
        end

        def setup_default_strategies(config)
          config.default_strategies :google_apps
          fail StandardError, "No Google Apps domain specified." if Rails.google_apps_domain.nil?
          config[:google_apps_domain] = Rails.google_apps_domain
          config[:google_apps_endpoint] = Rails.google_apps_endpoint
          config[:google_apps_redirect_url] = Rails.google_apps_redirect_url
        end

        def setup_failure_app(config)
          config.failure_app = lambda do |env|
            [403, {}, [env['warden'].message]]
          end
        end
      end
    end
  end
end
