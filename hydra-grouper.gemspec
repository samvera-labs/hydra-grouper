lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hydra/grouper/version'

Gem::Specification.new do |spec|
  spec.name          = "hydra-grouper"
  spec.version       = Hydra::Grouper::VERSION
  spec.authors       = ["Jeremy Friesen"]
  spec.email         = ["jeremy.n.friesen@gmail.com"]
  spec.license       = "Apache-2.0"

  spec.summary       = "Hydra Group / Role and General Conjecture"
  spec.description   = "The long awaited separation of groups and roles for Project Hydra."
  spec.homepage      = "https://github.com/projecthydra-labs/hydra-grouper"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'dry-equalizer', "~> 0.2"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "rails", ">= 4.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "simplecov"
end
