# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "elmas/version"

# rubocop:disable Metrics/BlockLength
Gem::Specification.new do |spec|
  spec.name          = "elmas"
  spec.authors       = ["Marthyn"]
  spec.email         = ["MarthynOlthof@hoppinger.nl"]

  spec.summary       = "API wrapper for Exact Online"
  spec.homepage      = "https://github.com/exactonline/exactonline-api-ruby-client"
  spec.licenses      = %w[MIT]

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.require_paths = %w[lib]
  spec.version       = Elmas::Version.to_s

  spec.add_dependency "activeresource"
  spec.add_dependency "activesupport"
  spec.add_dependency "faraday", [">= 0.12.1"]
  spec.add_dependency "mechanize", ">= 2.7.5"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-rubocop"
  spec.add_development_dependency "listen"
  spec.add_development_dependency "mutant-rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "ruby_dep"
  spec.add_development_dependency "rubycritic"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-rcov"
  spec.add_development_dependency "webmock"
end
