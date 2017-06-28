module SystemTester
  class Step < ApplicationRecord
    include TitleValidatable
    validates_uniqueness_of :title, scope: [:type, :arg_one, :arg_two]

    INDENT = " " * 6
    has_many :scenario_steps,
             class_name: "SystemTester::ScenarioStep",
             foreign_key: "system_tester_step_id",
             dependent: :destroy
    has_many :scenarios, through: :scenario_steps

    def self.friendly_type
      name.demodulize
    end

    def self.parent_type
      ancestors.fourth.name.demodulize
    end

    def friendly_type
      self.class.friendly_type
    end

    def parent_type
      self.class.parent_type
    end

    def self.args
      [
        {
          name: 'arg_one',
          label: 'One',
          type: 'text'
        },
        {
          name: 'arg_two',
          label: 'Two',
          type: 'text'
        }
      ]
    end

    def self.leafs
      (descendants - direct_descendants).map do |desc|
        {
          name: desc.to_s,
          friendly: desc.friendly_type,
          parent: desc.parent_type,
          args: desc.args
        }
      end.sort_by { |step_type| [step_type[:parent_type], step_type[:friendly]] }
    end

    def self.parent_types
      direct_descendants.map do |desc|
        {
          name: desc.to_s,
          friendly: desc.friendly_type
        }
      end.sort_by { |step_type| step_type[:friendly] }
    end

    def bg_css
      "teal"
    end

    def text_css
      "white-text"
    end
  end
end
