# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "procon/version"

Gem::Specification.new do |s|
  s.name        = "procon"
  s.version     = Procon::Version
  s.authors     = ["Dimas Priyanto"]
  s.email       = ["dimas.priyanto@gmail.com"]
  s.homepage    = "http://dimaspriyanto.com"
  s.summary     = %q{Process control ruby script}
  s.description = %q{Process control ruby script}

  s.rubyforge_project = "procon"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
