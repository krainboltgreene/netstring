# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "netstring/version"

Gem::Specification.new do |s|
  s.name        = "netstring"
  s.version     = Netstring::VERSION
  s.authors     = ["Kurtis Rainbolt-Greene"]
  s.email       = ["kurtisrainboltgreene@gmail.com"]
  s.homepage    = "http://krainboltgreene.github.com/netstring"
  s.summary     = %q{A parser for the TNetstring protocol.}
  s.description = %q{
    Netstring is a parser for the TNetstring protocol.
    The TNetstring protocol is a serialized data structure.
  }

  s.add_dependency("json")
  s.add_dependency("yaml")

  s.add_development_dependency("minitest")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
