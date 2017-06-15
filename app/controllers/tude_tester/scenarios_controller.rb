require_dependency "tude_tester/application_controller"

module TudeTester
  class ScenariosController < ApplicationController
    def index
      render json: Scenario.all.to_json(
        include: { steps: { methods: [:friendly_type, :parent_type] } },
        methods: [:feature, :to_s]
      )
    end

    def create
      scenario = Scenario.new(scenario_params)
      if scenario.save
        render json: scenario.to_json(
            include: { steps: { methods: [:friendly_type, :parent_type] } },
            methods: [:feature, :to_s]
        )
      else
        render json: { errors: scenario.errors }, status: :unprocessable_entity
      end
    end

    def update
      scenario = Scenario.find(params[:id])
      if scenario.update(scenario_params)
        render json: scenario.to_json(
            include: { steps: { methods: [:friendly_type, :parent_type] } },
            methods: [:feature, :to_s]
        )
      else
        render json: { errors: scenario.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      Scenario.find(params[:id]).destroy
      render head: :ok
    end

    private

    def scenario_params
      params.require(:scenario).permit(:title, :tude_tester_feature_id)
    end

  end
end
