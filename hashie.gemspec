# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hashie/version'

Gem::Specification.new do |spec|
  spec.name          = 'hashie'
  spec.version       = Hashie::VERSION
  spec.authors       = ['Maxim Slepukhov']
  spec.email         = ['maxtwain73@gmail.com']
  spec.summary       = ' Write a short summary. Required.'
  spec.description   = ' Write a longer description. Optional.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pre-commit'
  spec.add_development_dependency 'rubocop'
end
