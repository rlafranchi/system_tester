module TudeTester
  class Step < ApplicationRecord
    INDENT = " " * 6
    has_many :scenario_steps
    has_many :scenarios, through: :scenario_steps
  end
end
