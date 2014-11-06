require "rails-assets-jquery/version"


if defined?(Rails)
  module RailsAssetsJquery
    class Engine < ::Rails::Engine
      # Rails -> use vendor directory.
    end
  end
end
