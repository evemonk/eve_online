# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "eve_online/version"

Gem::Specification.new do |spec|
  spec.name = "eve_online"
  spec.version = EveOnline::VERSION
  spec.authors = ["Igor Zubkov"]
  spec.email = ["igor.zubkov@gmail.com"]

  spec.summary = "EveOnline ESI API"
  spec.description = "EveOnline ESI API."
  spec.homepage = "https://github.com/evemonk/eve_online"
  spec.license = "MIT"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/evemonk/eve_online/issues",
    "changelog_uri" => "https://github.com/evemonk/eve_online/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://github.com/evemonk/eve_online/blob/master/README.md",
    "homepage_uri" => "https://github.com/evemonk/eve_online",
    "source_code_uri" => "https://github.com/evemonk/eve_online"
  }

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|bin)/}) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.6"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "mdl"
  spec.add_development_dependency "appraisal"

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "faraday_middleware"
  spec.add_runtime_dependency "activesupport", ">= 5.2.0"
end
