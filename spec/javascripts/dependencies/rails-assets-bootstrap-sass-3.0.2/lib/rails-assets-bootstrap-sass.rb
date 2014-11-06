require "rails-assets-bootstrap-sass/version"

require "rails-assets-jquery"

if defined?(Rails)
  module RailsAssetsBootstrapSass
    class Engine < ::Rails::Engine
      # Rails -> use vendor directory.
    end
  end
end
