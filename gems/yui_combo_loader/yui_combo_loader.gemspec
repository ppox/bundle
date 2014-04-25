# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "yui_combo_loader"
  spec.version       = "0.0.1"
  spec.authors       = ["ClicRDV"]
  spec.email         = ["contact@clicrdv.com"]
  spec.summary       = %q{YUI Combo Loader}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rack"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
end
