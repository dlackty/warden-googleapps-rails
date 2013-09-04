module Warden
  module GoogleApps
    module Rails
      module Routes
        def googleapps_authenticate(&routes_block)
          googleapps_constraint(routes_block) do |warden|
            warden.authenticate!
          end
        end

        def googleapps_authenticated(&routes_block)
          googleapps_constraint(routes_block) do |warden|
            warden.authenticate?
          end
        end

        def googleapps_unauthenticated(&routes_block)
          googleapps_constraint(routes_block) do |warden|
            not warden.authenticated?
          end
        end

        private

        def googleapps_constraint(routes_block, &block)
          constraint = lambda do |request|
            warden = request.env['warden']
            block.call(warden)
          end

          constraints(constraint, &routes_block)
        end
      end
    end
  end
end

ActionDispatch::Routing::Mapper.send(:include, Warden::GoogleApps::Rails::Routes)
