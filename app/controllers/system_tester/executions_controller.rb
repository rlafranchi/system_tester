module SystemTester
  class ExecutionsController < ApplicationController
    def create
      feature = params[:feature_id].present? ? Feature.find(params[:feature_id]) : nil
      scenario = params[:scenario_id].present? ? Scenario.find(params[:scenario_id]) : nil
      @cmd = feature.present? ? "bin/rails test #{feature.full_file}" : "bin/rails test #{scenario.feature.full_file}:#{scenario.line_number}"
      status = handle_command
      render json: {exit_code: status}
    end

    private

    def handle_command
      command_handler = CommandHandler.new(@cmd)
      position = 0
      command_handler.run_each_line do |char|
        ActionCable.server.broadcast "system_tester_execution", {output: char, position: position}
        position += 1
      end
    end
  end
end