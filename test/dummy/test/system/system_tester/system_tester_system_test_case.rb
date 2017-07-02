require "../../test_helper"

module SystemTester
  class SystemTesterSystemTestCase < ActionDispatch::SystemTestCase
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end
end
