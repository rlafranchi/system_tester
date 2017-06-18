module TudeTester
  class ScenarioStep < ApplicationRecord
    belongs_to :step, class_name: "TudeTester::Step", foreign_key: "tude_tester_step_id"
    belongs_to :scenario, class_name: "TudeTester::Scenario", foreign_key: "tude_tester_scenario_id"
    validates_uniqueness_of :step, scope: [:scenario, :position]
    acts_as_list scope: :scenario
  end
end
