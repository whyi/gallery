# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-assets-angular-deckgrid/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-assets-angular-deckgrid"
  spec.version       = RailsAssetsAngularDeckgrid::VERSION
  spec.authors       = ["rails-assets.org"]
  spec.description   = "A lightweight masonry-like grid for AngularJS."
  spec.summary       = "A lightweight masonry-like grid for AngularJS."
  spec.homepage      = "https://github.com/akoenig/angular-deckgrid"

  spec.files         = `find ./* -type f | cut -b 3-`.split($/)
  spec.require_paths = ["lib"]

  spec.add_dependency "rails-assets-angular", "~> 1.2.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
