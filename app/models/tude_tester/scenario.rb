module TudeTester
  class Scenario < ApplicationRecord
    include TitleValidatable
    validates_uniqueness_of :title, scope: :tude_tester_feature_id

    INDENT = " " * 4
    belongs_to :feature, class_name: "TudeTester::Feature", foreign_key: "tude_tester_feature_id"
    has_many :scenario_steps,
             -> { order 'position asc' },
             class_name: "TudeTester::ScenarioStep",
             foreign_key: "tude_tester_scenario_id",
             dependent: :destroy
    has_many :steps, -> { order 'position asc' }, through: :scenario_steps

    def to_s
      str = ""
      str << open
      str << steps.map(&:to_s).join("")
      str << close
      str
    end
  
    private
    
    def open
      "#{INDENT}test \"#{title}\" do\n"
    end

    def close
      "#{INDENT}end\n"
    end
  end
end
