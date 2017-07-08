require 'test_helper'

module SystemTester
  class StairStepsControllerTest < ActionDispatch::IntegrationTest
    def setup
      @stair_step = Fabricate(:stair_step)
      @stair_step.touch
    end

    test "#create" do
      assert_difference 'SystemTester::StairStep.count', 1 do
        post '/system_tester/stair_steps', params: stair_step_params
      end
      assert_response :success
    end

    test "#create invalid" do
      post '/system_tester/stair_steps', params: stair_step_params(nil, -1, -1)
      assert JSON.parse(response.body)["errors"]["step"].present?
      assert JSON.parse(response.body)["errors"]["stair"].present?
      assert_response :unprocessable_entity
    end

    test "#update" do
      Fabricate(:stair_step, position: 2, step: @stair_step.step, stair: @stair_step.stair)
      put stair_step_path, params: stair_step_params(2)
      assert_equal 2, @stair_step.reload.position
      assert_response :success
    end

    test "#update invalid" do
      put stair_step_path, params: stair_step_params(nil,-1, -1)
      assert JSON.parse(response.body)["errors"]["step"].present?
      assert JSON.parse(response.body)["errors"]["stair"].present?
      assert_response :unprocessable_entity
    end

    test "#destroy" do
      assert_difference 'SystemTester::StairStep.count', -1 do
        delete stair_step_path
      end
      assert_response :success
    end

    private

    def stair_step_path
      "/system_tester/stair_steps/#{@stair_step.id}"
    end

    def stair_step_params(position=nil, step_id=nil, stair_id=nil)
      {
        stair_step: {
          position: position || 1,
          system_tester_step_id: step_id || @stair_step.step.id,
          system_tester_stair_id: stair_id || @stair_step.stair.id
        }
      }
    end
  end
end