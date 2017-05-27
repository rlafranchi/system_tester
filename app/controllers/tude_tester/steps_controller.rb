require_dependency "tude_tester/application_controller"

module TudeTester
  class StepsController < ApplicationController
    def index
      render json: Step.all.to_json(
        methods: [:type, :friendly_type, :parent_type, :to_s],
        include: :scenarios
      )
    end
  end
end
