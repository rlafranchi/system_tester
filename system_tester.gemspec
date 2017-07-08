$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "system_tester/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "system_tester"
  s.version     = SystemTester::VERSION
  s.authors     = ["Richard LaFranchi"]
  s.email       = ["rlafranchi@icloud.com"]
  s.homepage    = "http://github.com/rlafranchi/system_tester"
  s.summary     = "System Tester: Rails Sysyem Test Management"
  s.description = "System Tester aims to symplify QA for Rails applications by providing a development tool for creating and managing system tests"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.0"
  s.add_dependency "acts_as_list", "~> 0.8.0"
  s.add_dependency "rack-cors"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "faker"
  s.add_development_dependency "fabrication"
end
