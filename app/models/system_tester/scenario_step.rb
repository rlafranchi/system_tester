module SystemTester
  class ScenarioStep < ApplicationRecord
    belongs_to :step, class_name: "SystemTester::Step", foreign_key: "system_tester_step_id"
    belongs_to :scenario, class_name: "SystemTester::Scenario", foreign_key: "system_tester_scenario_id"
    acts_as_list scope: :system_tester_scenario_id

    after_commit do
      scenario.feature.touch if scenario.present? && scenario.feature.present?
    end
  end
end
