module SystemTester
  class StairStep < ApplicationRecord
    belongs_to :step, class_name: "SystemTester::Step", foreign_key: "system_tester_step_id"
    belongs_to :stair, class_name: "SystemTester::Stair", foreign_type: "SystemTester::Stair", foreign_key: "system_tester_stair_id"
    acts_as_list scope: :system_tester_stair_id

    after_commit do
      stair.touch if stair.present?
    end
  end
end