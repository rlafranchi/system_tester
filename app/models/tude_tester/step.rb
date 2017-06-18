module TudeTester
  class Step < ApplicationRecord
    include TitleValidatable
    validates_uniqueness_of :title, scope: [:type, :arg_one, :arg_two]

    INDENT = " " * 6
    has_many :scenario_steps,
             class_name: "TudeTester::ScenarioStep",
             foreign_key: "tude_tester_step_id",
             dependent: :destroy
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

    def bg_css
      "teal"
    end

    def text_css
      "#{bg_css}-text"
    end
  end
end
