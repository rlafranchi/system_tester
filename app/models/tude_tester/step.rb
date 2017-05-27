module TudeTester
  class Step < ApplicationRecord
    INDENT = " " * 6
    has_many :scenario_steps, class_name: "TudeTester::ScenarioStep", foreign_key: "tude_tester_step_id"
    has_many :scenarios, through: :scenario_steps

    def friendly_type
      self.class.name.demodulize
    end

    def parent_type
      self.class.ancestors.fourth.name.demodulize
    end

    def self.leafs
      descendants.map(&:to_s) - direct_descendants.map(&:to_s)
    end
  end
end
