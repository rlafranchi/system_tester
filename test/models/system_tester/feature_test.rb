require 'test_helper'

module SystemTester
  class FeatureTest < ActiveSupport::TestCase
    test "#to_s" do
      @feature = system_tester_features(:one)
      assert_equal script_basic_output, @feature.to_s
    end

    private

    def script_basic_output
      <<-EOF
require 'application_system_test_case'

module SystemTester
  class FeatureOneTest < ApplicationSystemTestCase
#{@feature.scenarios.map(&:to_s).join.chomp}
  end
end
EOF
    end
  end
end
