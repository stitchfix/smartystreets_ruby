# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "smartystreets/version"

Gem::Specification.new do |gem|
  gem.name          = 'smartystreets'
  gem.version       = SmartyStreets::GEM_VERSION
  gem.authors       = ['Peter Edge']
  gem.email         = ['peter.edge@gmail.com']
  gem.summary       = %{SmartyStreets API Wrapper}
  gem.description   = %{SmartyStreets API Wrapper for Ruby}
  gem.homepage      = 'https://github.com/peter-edge/smartystreets_ruby'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'httparty'
  gem.add_dependency 'multi_json'
  gem.add_dependency 'awesome_print'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'yard'
end
