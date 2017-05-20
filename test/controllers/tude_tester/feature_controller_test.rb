require 'test_helper'

module TudeTester
  class FeatureControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get feature_index_url
      assert_response :success
    end

  end
end
