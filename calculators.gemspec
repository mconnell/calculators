# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'calculators/version'

Gem::Specification.new do |spec|
  spec.name          = "calculators"
  spec.version       = Calculators::VERSION
  spec.authors       = ["Mark Connell"]
  spec.email         = ["mark@markconnell.co.uk"]

  spec.summary       = "Calculators"
  spec.description   = "Calculators"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
