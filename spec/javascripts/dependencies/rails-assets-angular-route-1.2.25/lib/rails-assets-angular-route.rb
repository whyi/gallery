require "rails-assets-angular-route/version"

require "rails-assets-angular"

if defined?(Rails)
  module RailsAssetsAngularRoute
    class Engine < ::Rails::Engine
      # Rails -> use vendor directory.
    end
  end
end
