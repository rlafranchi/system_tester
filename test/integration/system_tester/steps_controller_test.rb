require 'test_helper'

module SystemTester
  class StepsControllerTest < ActionDispatch::IntegrationTest
    def setup
      @click = Fabricate(:step, type: 'SystemTester::ClickOn')
      @fill = Fabricate(:step, type: 'SystemTester::FillIn')
      @visit = Fabricate(:step, type: 'SystemTester::Visit')
      @assert_selector = Fabricate(:step, type: 'SystemTester::AssertSelector')
      @assert_text = Fabricate(:step, type: 'SystemTester::AssertText')
      @stair = Fabricate(:stair)
      # just test one step
      @step = @click
    end

    test "#index" do
      get '/system_tester/steps'
      step_from_response = get_step(JSON.parse(response.body))
      assert_match "click_on", step_from_response["to_s"]
      assert_response :success
    end

    test "#show" do
      get step_path
      assert_response :success
    end

    # TODO new endopint not being used by client
    # the intention is to preview the code before saving
    test "#new" do
      get '/system_tester/steps/new', params: {step: {title: "happy", type: "SystemTester::ClickOn"}}
      assert_response :success
    end

    test "#create" do
      assert_difference 'SystemTester::Step.count', 1 do
        post '/system_tester/steps', params: step_params
      end
      assert_response :success
    end

    test "#create invalid" do
      post '/system_tester/steps', params: step_params("")
      assert JSON.parse(response.body)["errors"]["title"].present?
      assert_response :unprocessable_entity
    end

    test "#create stair" do
      assert_difference 'SystemTester::Step.count', 1 do
        post '/system_tester/steps', params: step_params(nil, 'SystemTester::Stair')
      end
      assert_response :success
    end

    test "#update" do
      new_title = Faker::Lorem.words(2).join(" ")
      put step_path, params: step_params(new_title)
      assert_equal new_title, @step.reload.title
      assert_response :success
    end

    test "#update stair" do
      new_title = "New Stair Title"
      put stair_path, params: step_params(new_title, @stair.type)
      assert_equal new_title, @stair.reload.title
      assert File.exist?(Rails.root.join("test", "support", "system_tester", "new_stair_title.rb"))
      assert_response :success
    end

    test "#update one connected to a step and scenario" do
      Fabricate(:scenario_step, step: @step)
      Fabricate(:stair_step, step: @step)
      new_title = Faker::Lorem.words(2).join(" ")
      put step_path, params: step_params(new_title)
      assert_equal new_title, @step.reload.title
      assert_response :success
    end

    test "#update invalid" do
      put step_path, params: step_params("")
      assert JSON.parse(response.body)["errors"]["title"].present?
      assert_response :unprocessable_entity
    end

    test "#destroy" do
      assert_difference 'SystemTester::Step.count', -1 do
        delete step_path
      end
      assert_response :success
    end

    test "#destroy stair" do
      assert_difference 'SystemTester::Stair.count', -1 do
        delete stair_path
      end
      assert_response :success
    end

    private

    def step_path
      "/system_tester/steps/#{@step.id}"
    end

    def stair_path
      "/system_tester/steps/#{@stair.id}"
    end

    def step_params(title=nil, type=nil)
      title = title || Faker::Lorem.words(2).join(" ")
      {
        step: {
          title: title,
          type: type || @step.type,
          arg_one: @step.arg_one,
          arg_two: @step.arg_two
        }
      }
    end

    def get_step(response)
      response.select { |f| f["id"] == @step.id }.first
    end
  end
end