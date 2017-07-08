require 'test_helper'

module SystemTester
  class SteptypesControllerTest < ActionDispatch::IntegrationTest
    def setup
      Dir.glob(SystemTester::Engine.root.join("app", "models" , "**", "*.rb")).each do |dep|
        require_dependency dep
      end
    end

    test"#index" do
      get "/system_tester/step_types"
      assert JSON.parse(response.body).length > 0
      assert_response :success
    end

    test "#parents" do
      get "/system_tester/step_types/parents"
      assert JSON.parse(response.body).length > 0
      assert_response :success
    end
  end
end