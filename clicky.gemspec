# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "clicky/version"

Gem::Specification.new do |s|
  s.name        = "clicky"
  s.version     = Clicky::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Federico Gonzalez"]
  s.email       = ["federico@boost.co.nz"]
  s.homepage    = ""
  s.summary     = %q{Easy access to the Clicky log API}
  s.description = %q{Manually create a event on the clicky service through the log API}

  s.rubyforge_project = "clicky"
  
  s.add_runtime_dependency('httparty', '~> 0.7.4')
  s.add_runtime_dependency('active_support', '> 2.3.8')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
