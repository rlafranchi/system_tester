require 'test_helper'

module SystemTester
  class FeaturesControllerTest < ActionDispatch::IntegrationTest
    test "#index" do
      get '/system_tester/features'
      assert_equal default_response, response.parsed_body
    end

    private

    def default_response
      [system_tester_features(:one).attributes]
    end
  end
end