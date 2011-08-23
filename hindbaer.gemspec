# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hindbaer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jamie Hodge"]
  gem.email         = ["jamiehodge@me.com"]
  gem.description   = %q{A Hindenburg Journalist client}
  gem.summary       = %q{Parse, modify and generate Hindenburg Journalist audio session files}
  gem.homepage      = "http://github.com/jamiehodge/hindbaer"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "hindbaer"
  gem.require_paths = ["lib"]
  gem.version       = Hindbaer::VERSION
  
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-minitest'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'growl_notify'
  gem.add_development_dependency 'mocha'
  
  gem.add_dependency 'nokogiri'
end
