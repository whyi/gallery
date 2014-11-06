require "rails-assets-angular-bootstrap/version"

require "rails-assets-angular"

if defined?(Rails)
  module RailsAssetsAngularBootstrap
    class Engine < ::Rails::Engine
      # Rails -> use vendor directory.
    end
  end
end
