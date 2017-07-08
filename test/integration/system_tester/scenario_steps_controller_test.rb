require 'test_helper'

module SystemTester
  class ScenarioStepsControllerTest < ActionDispatch::IntegrationTest
    def setup
      @scenario_step = Fabricate(:scenario_step)
      @scenario_step.touch
    end

    def teardown
      Feature.destroy_all
      FileUtils.rm_r(Rails.root.join("test", "system", "system_tester"))
    end

    test "#create" do
      assert_difference 'SystemTester::ScenarioStep.count', 1 do
        post '/system_tester/scenario_steps', params: scenario_step_params
      end
      assert_response :success
    end

    test "#create invalid" do
      post '/system_tester/scenario_steps', params: scenario_step_params(nil, -1, -1)
      assert JSON.parse(response.body)["errors"]["step"].present?
      assert JSON.parse(response.body)["errors"]["scenario"].present?
      assert_response :unprocessable_entity
    end

    test "#create for stair" do
      stair = Fabricate(:stair)
      assert_difference 'SystemTester::ScenarioStep.count', 1 do
        post '/system_tester/scenario_steps', params: scenario_step_params(nil, stair.id)
      end
      assert_response :success
    end

    test "#update" do
      Fabricate(:scenario_step, position: 2, step: @scenario_step.step, scenario: @scenario_step.scenario)
      put scenario_step_path, params: scenario_step_params(2)
      assert_equal 2, @scenario_step.reload.position
      assert_response :success
    end

    test "#update invalid" do
      put scenario_step_path, params: scenario_step_params(nil,-1, -1)
      assert JSON.parse(response.body)["errors"]["step"].present?
      assert JSON.parse(response.body)["errors"]["scenario"].present?
      assert_response :unprocessable_entity
    end

    test "#destroy" do
      assert_difference 'SystemTester::ScenarioStep.count', -1 do
        delete scenario_step_path
      end
      assert_response :success
    end

    private

    def scenario_step_path
      "/system_tester/scenario_steps/#{@scenario_step.id}"
    end

    def scenario_step_params(position=nil, step_id=nil, scenario_id=nil)
      {
        scenario_step: {
          position: position || 1,
          system_tester_step_id: step_id || @scenario_step.step.id,
          system_tester_scenario_id: scenario_id || @scenario_step.scenario.id
        }
      }
    end
  end
end