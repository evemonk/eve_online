# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eve_online/version'

Gem::Specification.new do |spec|
  spec.name          = 'eve_online'
  spec.version       = EveOnline::VERSION
  spec.authors       = ['Igor Zubkov']
  spec.email         = ['igor.zubkov@gmail.com']

  spec.summary       = 'EveOnline API. XML and CREST.'
  spec.description   = 'EveOnline API. XML and CREST.'
  spec.homepage      = 'https://github.com/biow0lf/eve_online'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|bin)/}) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'codeclimate-test-reporter'

  spec.add_runtime_dependency 'activesupport', '>= 3.0.0'
  spec.add_runtime_dependency 'nori', '~> 2.6'
  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'memoist'
end
