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

    def self.friendly_type
      name.demodulize
    end

    def friendly_type
      self.class.friendly_type
    end

    def parent_type
      self.class.ancestors.fourth.name.demodulize
    end

    def self.leafs
      (descendants - direct_descendants).map do |desc|
        {
          name: desc.to_s,
          friendly: desc.friendly_type
        }
      end
    end

    def bg_css
      "teal"
    end

    def text_css
      "white-text"
    end
  end
end
