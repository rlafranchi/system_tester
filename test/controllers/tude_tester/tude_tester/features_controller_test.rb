require 'test_helper'

module TudeTester
  class TudeTester::FeaturesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get tude_tester_features_index_url
      assert_response :success
    end

  end
end
