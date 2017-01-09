$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "omniauth-ccpi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "omniauth-ccpi"
  s.version     = OmniAuth::Ccpi::VERSION
  s.authors     = ["Ccpi Software", "Nicholas W. Watson"]
  s.email       = ["nicholas.w.watson@me.com"]
  s.homepage    = "http://github.com/gleasontech/omniauth-ccpi"
  s.summary     = "OmniAuth strategy for Gleason Ccpi"
  s.description = "OmniAuth strategy for Gleason Ccpi"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "omniauth", "~> 1.3.1"
  s.add_dependency "omniauth-oauth2", "~> 1.4.0"

  s.add_development_dependency "sqlite3"
end
