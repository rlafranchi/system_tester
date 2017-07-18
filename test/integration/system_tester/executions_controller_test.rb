require 'test_helper'

module SystemTester
  class ExecutionsControllerTest < ActionDispatch::IntegrationTest
    def setup
      @scenario = Fabricate(:scenario, title: "Feature Tester Title")
      @scenario.touch
      CommandHandler.any_instance.expects(:run_each_line).yields("out").returns(0)
    end

    test "#create feature" do
      post '/system_tester/executions', params: {feature_id: @scenario.feature.id}
      assert_equal 0, JSON.parse(response.body)["exit_code"]
      assert_response :success
    end

    test "#create scenario" do
      post '/system_tester/executions', params: {scenario_id: @scenario.id}
      assert_equal 0, JSON.parse(response.body)["exit_code"]
      assert_response :success
    end

  end
end