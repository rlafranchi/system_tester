module TudeTester
  class ApplicationController < ActionController::API
    # protect_from_forgery with: :exception
    before_action :set_headers

    private

    def set_headers
      headers['Access-Control-Allow-Origin'] = 'http://localhost:8080'
    end
  end
end
