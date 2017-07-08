require 'test_helper'

module SystemTester
  class StatusControllerTest < ActionDispatch::IntegrationTest
    test "#index" do
      get "/system_tester/status"
      assert_equal "OK", JSON.parse(response.body)["status"]
      assert_equal SystemTester::VERSION, JSON.parse(response.body)["version"]
      assert_response :success
    end
  end
end