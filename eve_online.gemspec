# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eveonline/version'

Gem::Specification.new do |spec|
  spec.name          = "eve_online"
  spec.version       = Eveonline::VERSION
  spec.authors       = ["Igor Zubkov"]
  spec.email         = ["igor.zubkov@gmail.com"]

  spec.summary       = %q{EveOnline API. XML and CREST.}
  spec.description   = %q{EveOnline API. XML and CREST.}
  spec.homepage      = "https://github.com/biow0lf/eve_online"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|bin)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'webmock'

  spec.add_runtime_dependency 'nori', '~> 2.6'
end
