require_dependency "system_tester/application_controller"

module SystemTester
  class ScenarioStepsController < ApplicationController

    def create
      scenario_step = ScenarioStep.new(scenario_step_params)
      if scenario_step.save
        render json: scenario_step.to_json(scenario_step_json_options)
      else
        render json: { errors: scenario_step.errors }, status: :unprocessable_entity
      end
    end

    def update
      scenario_step = ScenarioStep.find(params[:id])
      if scenario_step.update(scenario_step_params)
        render json: scenario_step.to_json(scenario_step_json_options)
      else
        render json: { errors: scenario_step.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      ScenarioStep.find(params[:id]).destroy!
      render json: {}
    end

    private

    def scenario_step_params
      params.require(:scenario_step).permit(:position, :system_tester_step_id, :system_tester_scenario_id)
    end

    def scenario_step_json_options
      {
        include: :step
      }
    end

  end
end