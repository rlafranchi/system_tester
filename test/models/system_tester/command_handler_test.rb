require 'test_helper'

module SystemTester
  class CommandHandlerTest < ActiveSupport::TestCase
    test "#run" do
      ch = SystemTester::CommandHandler.new("echo 'hello'")
      result = ""
      ch.run do |c|
        result << c
      end
      assert_equal 0, ch.status
      assert_match "hello", result
    end

    test "#run_each_line" do
      ch = SystemTester::CommandHandler.new("echo 'hello'")
      result = ""
      ch.run_each_line do |line|
        result << line
      end
      assert_equal 0, ch.status
      assert_match "hello", result
    end
  end
end
