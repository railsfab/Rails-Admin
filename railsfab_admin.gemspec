$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "railsfab_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "railsfab_admin"
  s.version     = RailsfabAdmin::VERSION
  s.authors     = ["bhaskar8088"]
  s.email       = ["bhaskar8088@gmail.com"]
  s.homepage    = "http://www.railsfab.com"
  s.summary     = "Easy interface to add/edit table data."
  s.description = "Easy interface to add/edit table data."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
