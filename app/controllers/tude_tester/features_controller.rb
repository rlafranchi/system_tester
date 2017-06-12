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
        render json: { errors: feature.errors }, status: :unprocessable_entity
      end
    end

    def update
      feature = Feature.find(params[:id])
      if feature.update(feature_params)
        render json: feature.to_json(
            methods: [:to_s],
            include: :scenarios
        )
      else
        render json: { errors: feature.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      Feature.find(params[:id]).destroy
      render head: :ok
    end

    private

    def feature_params
      params.require(:feature).permit(:title)
    end

  end
end
