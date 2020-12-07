# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
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
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'simplecov-rcov', '~> 0.2.3'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'gem-release', '~> 2.1'
  spec.add_development_dependency 'rubocop', '~> 1.5.2'
end
