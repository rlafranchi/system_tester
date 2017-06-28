module SystemTester
  class ApplicationController < ActionController::API
    # protect_from_forgery with: :exception
    # before_action :set_headers

    private

    def set_headers
      headers['Access-Control-Allow-Origin'] = 'http://localhost:8080'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
  end
end
