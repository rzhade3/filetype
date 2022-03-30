$:.push File.expand_path("../lib", __FILE__)
require "filetype"

Gem::Specification.new do |s|
  s.name        = "filetype"
  s.version     = Filetype::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lee Jarvis"]
  s.email       = ["lee@jarvis.co"]
  s.homepage    = "http://github.com/injekt/filetype"
  s.summary     = "Find a files type"
  s.description = "Find a file type according to a filename or extension"
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n").reject do |f|
    f.match(%r{^(test|spec|features|\.github)/})
  end
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
