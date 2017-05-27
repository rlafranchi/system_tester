require_dependency "tude_tester/application_controller"

module TudeTester
  class FeaturesController < ApplicationController
    def index
      render json: Feature.all.to_json(
        methods: [:to_s],
        include: :scenarios
      )
    end
  end
end
