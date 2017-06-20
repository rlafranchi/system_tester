require_dependency "tude_tester/application_controller"

module TudeTester
  class ScenariosController < ApplicationController
    def index
      render json: Scenario.all.to_json(scenario_json_options)
    end

    def show
      scenario = Scenario.find(params[:id])
      render json: scenario.to_json(scenario_json_options)
    end

    def create
      scenario = Scenario.new(scenario_params)
      if scenario.save
        render json: scenario.to_json(scenario_json_options)
      else
        render json: { errors: scenario.errors }, status: :unprocessable_entity
      end
    end

    def update
      scenario = Scenario.find(params[:id])
      if scenario.update(scenario_params)
        render json: scenario.to_json(scenario_json_options)
      else
        render json: { errors: scenario.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      Scenario.find(params[:id]).destroy!
      render head: :ok
    end

    private

    def scenario_params
      params.require(:scenario).permit(:title, :tude_tester_feature_id)
    end

    def scenario_json_options
      {
        include: {
          scenario_steps: {
            include: {
              step: {
                methods: [:friendly_type, :parent_type, :bg_css, :text_css, :icon]
              }
            }
          },
          feature: {}
        },
        methods: [:to_s]
      }
    end

  end
end
