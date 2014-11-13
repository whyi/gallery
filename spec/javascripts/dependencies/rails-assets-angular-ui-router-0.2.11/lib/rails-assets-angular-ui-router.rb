require "rails-assets-angular-ui-router/version"

require "rails-assets-angular"

if defined?(Rails)
  module RailsAssetsAngularUiRouter
    class Engine < ::Rails::Engine
      # Rails -> use vendor directory.
    end
  end
end
