module Warden
  module GoogleApps
    module Rails
      module ControllerHelpers
        def self.included(klass)
          klass.helper_method(:googleapps_authenticated?, :googleapps_user)
        end

        def googleapps_authenticate!
          request.env['warden'].authenticate!
        end

        def googleapps_logout
          request.env['warden'].logout
        end

        def googleapps_authenticated?
          request.env['warden'].authenticated?
        end

        def googleapps_user
          request.env['warden'].user
        end

        def googleapps_session
          request.env['warden'].session if googleapps_authenticated?
        end
      end
    end
  end
end
