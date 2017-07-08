require 'test_helper'

module SystemTester
  class ScenariosControllerTest < ActionDispatch::IntegrationTest
    def setup
      @scenario = Fabricate(:scenario)
      @scenario.touch
    end

    def teardown
      Feature.destroy_all
      FileUtils.rm_r(Rails.root.join("test", "system", "system_tester"))
    end

    test "#index" do
      get '/system_tester/scenarios'
      scenario_from_response = get_scenario(JSON.parse(response.body))
      assert_match @scenario.title, scenario_from_response["to_s"]
      assert_response :success
    end

    test "#create" do
      assert_difference 'SystemTester::Scenario.count', 1 do
        post '/system_tester/scenarios', params: scenario_params
      end
      assert_response :success
    end

    test "#create invalid" do
      post '/system_tester/scenarios', params: scenario_params(@scenario.title, @scenario.system_tester_feature_id)
      assert JSON.parse(response.body)["errors"]["title"].present?
      assert_response :unprocessable_entity
    end

    test "#update" do
      new_title = Faker::Lorem.words(2).join(" ")
      put scenario_path, params: scenario_params(new_title)
      assert_equal new_title, @scenario.reload.title
      assert_response :success
    end

    test "#update invalid" do
      other_scenario = Fabricate(:scenario, title: "Other scenario Title")
      put scenario_path, params: scenario_params(other_scenario.title, other_scenario.system_tester_feature_id)
      assert JSON.parse(response.body)["errors"]["title"].present?
      assert_response :unprocessable_entity
    end

    test "#destroy" do
      assert_difference 'SystemTester::Scenario.count', -1 do
        delete scenario_path
      end
      assert_response :success
    end

    private

    def scenario_path
      "/system_tester/scenarios/#{@scenario.id}"
    end

    def scenario_params(title=nil, feature_id=nil)
      title = title || Faker::Lorem.words(2).join(" ")
      {
        scenario: {
          title: title,
          system_tester_feature_id: feature_id || Fabricate(:feature).id
        }
      }
    end

    def get_scenario(response)
      response.select { |f| f["id"] == @scenario.id }.first
    end
  end
end