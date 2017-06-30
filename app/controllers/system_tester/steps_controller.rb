require_dependency "system_tester/application_controller"

module SystemTester
  class StepsController < ApplicationController
    def index
      render json: Step.all.to_json(step_json_options)
    end

    def show
      render json: Step.find(params[:id]).to_json(step_json_options)
    end

    def new
      render json: Step.new(step_params).to_json(step_json_options)
    end

    def create
      step = Step.new(step_params)
      if step.save
        render json: step.to_json(step_json_options)
      else
        render json: { errors: step.errors }, status: :unprocessable_entity
      end
    end

    def update
      step = Step.find(params[:id])
      if step.update(step_params)
        render json: step.to_json(step_json_options)
      else
        render json: { errors: step.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      Step.find(params[:id]).destroy!
      render head: :ok
    end
    
    private
    
    def step_params
      params.require(:step).permit(:title, :type, :arg_one, :arg_two)
    end
    
    def step_json_options
      {
        methods: [:type, :friendly_type, :parent_type, :to_s, :bg_css, :text_css, :icon, :module],
        include: {
          scenarios: {},
          stair_steps: {
            include: {
              step: {
                methods: [:friendly_type, :parent_type, :bg_css, :text_css, :icon]
              }
            }
          }
        }
      }
    end
  end
end
