lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/suggest/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-suggest"
  spec.version       = Ruboty::Suggest::VERSION
  spec.authors       = ["redfit"]
  spec.email         = ["nagita.0724.0812@gmail.com"]

  spec.summary       = %q{Enables ruboty to suggest commands when not found.}
  spec.homepage      = "https://github.com/redfit/ruboty-suggest"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty", ">= 1.2.4"
  spec.add_dependency "levenshtein", ">= 0.2.2"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
