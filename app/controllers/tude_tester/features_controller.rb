require_dependency "tude_tester/application_controller"

module TudeTester
  class FeaturesController < ApplicationController
    def index
      render json: Feature.all.to_json(
        methods: [:to_s],
        include: :scenarios
      )
    end

    def create
      feature = Feature.new(feature_params)
      if feature.save
        render json: feature.to_json(
          methods: [:to_s],
          include: :scenarios
        )
      else
        render json: { errors: feature.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def feature_params
      params.require(:feature).permit(:title)
    end
  end
end
