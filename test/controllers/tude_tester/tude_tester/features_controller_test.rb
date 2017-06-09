require 'test_helper'

module TudeTester
  class TudeTester::FeaturesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get tude_tester_features_index_url
      assert_response :success
    end

    test "should post create" do
      assert_difference('Feature.count', 1) do
        post tude_tester_features_create_url, params: { feature: { title: 'Title' } }
      end
      assert_response :success
    end

  end
end
