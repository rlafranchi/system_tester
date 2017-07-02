require_dependency "system_tester/application_controller"

module SystemTester
  class FeaturesController < ApplicationController
    def index
      Rails.logger.debug "Heeeeeeeeee"
      render json: Feature.all.to_json(feature_json_options)
    end

    def create
      feature = Feature.new(feature_params)
      if feature.save
        render json: feature.to_json(feature_json_options)
      else
        render json: { errors: feature.errors }, status: :unprocessable_entity
      end
    end

    def update
      feature = Feature.find(params[:id])
      if feature.update(feature_params)
        render json: feature.to_json(feature_json_options)
      else
        render json: { errors: feature.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      Feature.find(params[:id]).destroy!
      render head: :ok
    end

    private

    def feature_params
      params.require(:feature).permit(:title)
    end

    def feature_json_options
      {
        methods: [:to_s],
        include: :scenarios
      }
    end

  end
end
