require 'system_tester_system_test_case'

module SystemTester
  class ExampleTest < SystemTesterSystemTestCase
    include StairOneChanged

    test "Scenario" do
      # Stair: Stair One Changed
      stair_one_changed

      # Action: Visit New Path as
      visit "/examples/new"

    end
  end
end
