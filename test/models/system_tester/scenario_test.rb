require 'test_helper'

module SystemTester
  class ScenarioTest < ActiveSupport::TestCase
    test "#to_s" do
      scenario = system_tester_scenarios(:one)
      assert_equal script_basic_output, scenario.to_s
    end

    private

    def script_basic_output
      <<-EOF
    test "Scenario One" do
      # Action: Click on element
      click_on "element"

      # Action: visit path
      visit path

      # Assertion: assert text
      assert_selector "h1", text: "text"

    end
EOF
    end
  end
end
