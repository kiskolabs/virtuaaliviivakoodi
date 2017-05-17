# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'virtuaaliviivakoodi/version'

Gem::Specification.new do |spec|
  spec.name          = "virtuaaliviivakoodi"
  spec.version       = Virtuaaliviivakoodi::VERSION
  spec.authors       = ["Vesa Vänskä"]
  spec.email         = ["vesa@vesavanska.com"]

  spec.summary       = %q{Creates virtuaaliviivakoodi}
  spec.description   = %q{Creates virtuaaliviivakoodi}
  spec.homepage      = "https://github.com/kiskolabs/virtuaaliviivakoodi"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "iban-tools", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
