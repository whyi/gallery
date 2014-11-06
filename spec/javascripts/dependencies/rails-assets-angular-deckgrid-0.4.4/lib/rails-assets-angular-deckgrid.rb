require "rails-assets-angular-deckgrid/version"

require "rails-assets-angular"

if defined?(Rails)
  module RailsAssetsAngularDeckgrid
    class Engine < ::Rails::Engine
      # Rails -> use vendor directory.
    end
  end
end
