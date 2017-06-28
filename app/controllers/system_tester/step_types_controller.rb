require_dependency "system_tester/application_controller"

module SystemTester
  class StepTypesController < ApplicationController
    def index
      render json: Step.leafs
    end

    def parents
      render json: Step.parent_types
    end
  end
end