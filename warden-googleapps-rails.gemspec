# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'warden/googleapps/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "warden-googleapps-rails"
  spec.version       = Warden::GoogleApps::Rails::VERSION
  spec.authors       = ["Richard Lee"]
  spec.email         = ["dlackty@gmail.com"]
  spec.summary       = %q{Simple integration for Rails to use Google Apps authentication.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/dlackty/warden-googleapps-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec', '~> 2.12'

  spec.add_dependency 'warden-googleapps', '~> 0.1.4'
  spec.add_dependency 'railties', '>= 3.1'
end
