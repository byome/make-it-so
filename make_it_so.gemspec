# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "make_it_so/version"

Gem::Specification.new do |spec|
  spec.name          = "make_it_so"
  spec.version       = MakeItSo::VERSION
  spec.authors       = ["Miles Zimmerman"]
  spec.email         = ["miles@byome.io"]
  spec.summary       = %q{Automate rust server updates}
  spec.description   = %q{Automate rust server updates bro}
  spec.homepage      = "https://byome.io/"
  spec.license       = "MIT"

  spec.files         = ['lib/make_it_so.rb']
  spec.executables   = ['bin/make_it_so']
  spec.bindir        = ['bin']
  spec.require_paths = ["lib"]

  spec.add_dependency "mechanize", "~> 2.7.5"
  spec.add_dependency "dotenv", "~> 2.2.1"

  spec.add_development_dependency "bundler", "~> 1.14.6"
  spec.add_development_dependency "pry", "~> 0.10.4"
end
