require_dependency "tude_tester/application_controller"

module TudeTester
  class ScenariosController < ApplicationController
    def index
      render json: Scenario.all.to_json(methods: [:feature, :to_s])
    end
  end
end
