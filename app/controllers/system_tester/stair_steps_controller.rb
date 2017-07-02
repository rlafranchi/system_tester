require_dependency "system_tester/application_controller"

module SystemTester
  class StairStepsController < ApplicationController

    def create
      stair_step = StairStep.new(stair_step_params)
      if stair_step.save
        render json: stair_step.to_json(stair_step_json_options)
      else
        render json: { errors: stair_step.errors }, status: :unprocessable_entity
      end
    end

    def update
      stair_step = StairStep.find(params[:id])
      if stair_step.update(stair_step_params)
        render json: stair_step.to_json(stair_step_json_options)
      else
        render json: { errors: stair_step.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      StairStep.find(params[:id]).destroy!
      render json: {}
    end

    private

    def stair_step_params
      params.require(:stair_step).permit(:position, :system_tester_step_id, :system_tester_stair_id)
    end

    def stair_step_json_options
      {
        include: :step
      }
    end

  end
end