lib = File.expand_path('../lib', __FILE__)
# frozen_string_literal: true

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplecov-rcov-setup/version'

Gem::Specification.new do |spec|
  spec.name          = 'simplecov-rcov-setup'
  spec.version       = SimpleCov::Formatter::RcovFormatter::Setup::VERSION
  spec.authors       = ['KARASZI István']
  spec.email         = ['github@spam.raszi.hu']
  spec.summary       = 'SimpleCov Rcov Formatter setup'
  spec.description   = 'Helps to setup SimpleCov Rcov formatter'
  spec.homepage      = 'https://github.com/raszi/simplecov-rcov-setup'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'simplecov-rcov', '~> 0.2.3'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rubocop', '~> 0.88.0'
end
