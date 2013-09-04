require 'forwardable'

require "warden/googleapps/rails/config"
require "warden/googleapps/rails/controller_helpers"
require "warden/googleapps/rails/railtie"
require "warden/googleapps/rails/routes"

module Warden
  module GoogleApps
    module Rails
      extend SingleForwardable

      def_delegators :config,
                     :google_apps_domain,
                     :google_apps_endpoint, 
                     :google_apps_redirect_url

      @config = Config.new

      def self.google_apps_domain
        self.config.google_apps_domain
      end

      def self.config
        @config
      end

      def self.setup
        yield config
      end
    end
  end
end
