require_dependency "tude_tester/application_controller"

module TudeTester
  class StepsController < ApplicationController
    def index
      results = Step.includes(:scenarios).map(&:attributes).group_by { |step| step["type"] }
      render json: results
    end
  end
end
