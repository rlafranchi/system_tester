module SystemTester
  class ExecutionChannel < ApplicationCable::Channel
    def subscribed
      stream_from "system_tester_execution"
    end
  end
end
