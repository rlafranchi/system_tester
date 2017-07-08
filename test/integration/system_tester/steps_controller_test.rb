require 'test_helper'

module SystemTester
  class StepsControllerTest < ActionDispatch::IntegrationTest
    def setup
      @click = Fabricate(:step, type: 'SystemTester::ClickOn')
      @fill = Fabricate(:step, type: 'SystemTester::FillIn')
      @visit = Fabricate(:step, type: 'SystemTester::Visit')
      @assert_selector = Fabricate(:step, type: 'SystemTester::AssertSelector')
      @assert_text = Fabricate(:step, type: 'SystemTester::AssertText')

      # just test one step
      @step = @click
    end

    test "#index" do
      get '/system_tester/steps'
      step_from_response = get_step(JSON.parse(response.body))
      assert_match "click_on", step_from_response["to_s"]
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

    test "#update" do
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

    private

    def step_path
      "/system_tester/steps/#{@step.id}"
    end

    def step_params(title=nil)
      title = title || Faker::Lorem.words(2).join(" ")
      {
        step: {
          title: title,
          type: @step.type,
          arg_one: @step.type,
          arg_two: @step.type
        }
      }
    end

    def get_step(response)
      response.select { |f| f["id"] == @step.id }.first
    end
  end
end