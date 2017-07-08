require 'test_helper'

module SystemTester
  class FeaturesControllerTest < ActionDispatch::IntegrationTest
    def setup
      @feature = Fabricate(:system_tester_feature, title: "Feature Tester Title")
      @feature.touch
    end

    def teardown
      FileUtils.rm_r(Rails.root.join("test", "system", "system_tester"))
    end

    test "#index" do
      get '/system_tester/features'
      feature_from_response = get_feature(JSON.parse(response.body))
      assert_match "FeatureTesterTitle", feature_from_response["to_s"]
      assert_response :success
    end

    test "#create" do
      assert_difference 'SystemTester::Feature.count', 1 do
        post '/system_tester/features', params: {
          feature: {
            title: Faker::Lorem.words(2).join(" ")
          }
        }
      end
      assert_response :success
    end

    test "#create invalid" do
      post '/system_tester/features', params: {
        feature: {
          title: @feature.title
        }
      }
      assert JSON.parse(response.body)["errors"]["title"].present?
      assert_response :unprocessable_entity
    end

    test "#update" do
      new_title = Faker::Lorem.words(2).join(" ")
      put feature_path, params: {
        feature: {
          title: new_title
        }
      }
      assert_equal new_title, @feature.reload.title
      assert_response :success
    end

    test "#destroy" do
      assert_difference 'SystemTester::Feature.count', -1 do
        delete feature_path
      end
      assert_response :success
    end

    private

    def feature_path
      "/system_tester/features/#{@feature.id}"
    end

    def get_feature(response)
      response.select { |f| f["id"] == @feature.id }.first
    end
  end
end