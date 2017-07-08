require 'test_helper'

module SystemTester
  class FeaturesControllerTest < ActionDispatch::IntegrationTest
    def setup
      @feature = Fabricate(:feature, title: "Feature Tester Title")
      @feature.touch
    end

    test "#index" do
      get '/system_tester/features'
      feature_from_response = get_feature(JSON.parse(response.body))
      assert_match "FeatureTesterTitle", feature_from_response["to_s"]
      assert_response :success
    end

    test "#create" do
      assert_difference 'SystemTester::Feature.count', 1 do
        post '/system_tester/features', params: feature_params
      end
      assert_response :success
    end

    test "#create invalid" do
      post '/system_tester/features', params: feature_params(@feature.title)
      assert JSON.parse(response.body)["errors"]["title"].present?
      assert_response :unprocessable_entity
    end

    test "#update" do
      new_title = "New Feature Title"
      put feature_path, params: feature_params(new_title)
      assert File.exist?(Rails.root.join("test", "system", "system_tester", "new_feature_title_test.rb"))
      assert_equal new_title, @feature.reload.title
      assert_response :success
    end

    test "#update invalid" do
      other_feature = Fabricate(:feature, title: "Other Feature Title")
      put feature_path, params: feature_params(other_feature.title)
      assert JSON.parse(response.body)["errors"]["title"].present?
      assert_response :unprocessable_entity
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

    def feature_params(title=Faker::Lorem.words(2).join(" "))
      {
        feature: {
          title: title
        }
      }
    end

    def get_feature(response)
      response.select { |f| f["id"] == @feature.id }.first
    end
  end
end