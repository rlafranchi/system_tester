require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require "rails/test_help"
require "mocha/mini_test"
require "faker"
require "fabrication"
require "simplecov"
SimpleCov.start :rails do
  filters.clear
  add_filter do |src|
    !(src.filename =~ /^#{SimpleCov.root}/) unless src.filename =~ /system_tester/
  end
  add_filter '/app/jobs/'
  add_filter '/lib/'
  add_filter '/test/'
end

Fabrication.configure do |config|
  config.fabricator_path = 'test/fabricators'
  config.path_prefix = SystemTester::Engine.root
end

class ActionDispatch::IntegrationTest

  # Drop all columns after each test case.
  teardown :clean_up
  def clean_up
    SystemTester::Feature.destroy_all
    SystemTester::Stair.destroy_all
    path1 = Rails.root.join("test", "system", "system_tester")
    path2 = Rails.root.join("test", "support", "system_tester")
    FileUtils.rm_r(path1) if File.exist?(path1)
    FileUtils.rm_r(path2) if File.exist?(path2)
  end

end

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new


# Load fixtures from the engine
# if ActiveSupport::TestCase.respond_to?(:fixture_path=)
#   ActiveSupport::TestCase.fixture_path = File.expand_path("./fabricators/system_tester", __FILE__)
#   ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
#   ActiveSupport::TestCase.file_fixture_path = File.expand_path("./fixtures/files", __FILE__)
#   # ActiveSupport::TestCase.fixtures :all
# end
