$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tude_tester/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tude_tester"
  s.version     = TudeTester::VERSION
  s.authors     = ["Richard LaFranchi"]
  s.email       = ["rlafranchi@icloud.com"]
  s.homepage    = "http://github.com/rlafranchi/tude_tester"
  s.summary     = "TudeTester: Rails Testing at Altitude"
  s.description = "TudeTester aims to symplify QA for Rails applications by providing a development tool for creating and managing system tests"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.0"
  s.add_dependency "acts_as_list", "~> 0.8.0"

  s.add_development_dependency "sqlite3"
end
