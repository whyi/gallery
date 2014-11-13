require "rails-assets-angular/version"


if defined?(Rails)
  module RailsAssetsAngular
    class Engine < ::Rails::Engine
      # Rails -> use vendor directory.
    end
  end
end
