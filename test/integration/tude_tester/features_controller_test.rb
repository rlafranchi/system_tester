require 'test_helper'

module TudeTester
  class FeaturesControllerTest < ActionDispatch::IntegrationTest
    test "#index" do
      get '/tude_tester/features'
      assert_equal default_response, response.parsed_body
    end

    private

    def default_response
      [tude_tester_features(:one).attributes]
    end
  end
end