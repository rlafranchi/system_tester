module SystemTester
  class StatusController < ApplicationController

    def index
      render json: {status: "OK", version: SystemTester::VERSION}
    end
  end
end
