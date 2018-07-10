# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'corelogic/version'

Gem::Specification.new do |spec|
  spec.name          = "corelogic-ruby"
  spec.version       = Corelogic::VERSION
  spec.authors       = ["Ilia Kriachkov"]
  spec.email         = ["ilia.kriachkov@jetrockets.ru"]

  spec.summary       = "Ruby wrapper for the CoreLogic Property API"
  spec.description   = "Ruby wrapper for the CoreLogic Property API. http://developer.corelogic.com/"
  spec.homepage      = "https://github.com/jetrockets/corelogic-ruby"
  spec.license       = "MIT"

  spec.files         = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*'
  ]
  spec.bindir        = "bin"

  spec.require_paths = ["lib"]
  spec.required_ruby_version = '~> 2.4'

   # a b c d e f g h i j k l m n o p q r s t u v w x y z
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'simplecov', '>= 0.6.2'
  spec.add_development_dependency 'webmock'
end
