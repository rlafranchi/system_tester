require_dependency "tude_tester/application_controller"

module TudeTester
  class StepTypesController < ApplicationController
    def index
      render json: Step.leafs
    end
  end
end