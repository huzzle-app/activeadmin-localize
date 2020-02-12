# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activeadmin-localize/version'

Gem::Specification.new do |gem|
  gem.name          = "activeadmin-localize"
  gem.version       = ActiveAdmin::Localize::VERSION
  gem.authors       = ["Gleb Tv"]
  gem.email         = ["glebtv@gmail.com"]
  gem.description   = %q{Easily edit localized fields in ActiveAdmin (all locales on one page)}
  gem.summary       = %q{Localized fields for active admin}
  gem.homepage      = "https://github.com/glebtv/activeadmin-localize"

  gem.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(screenshots)/})
  end
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency(%q<activeadmin>, "~> 2.6.0")
end
