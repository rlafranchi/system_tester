class CreateTudeTesterScenarioSteps < ActiveRecord::Migration[5.1]
  def change
    if Rails.env.tude_tester?
      create_table :tude_tester_scenario_steps do |t|
        t.integer :position
        t.references :tude_tester_step, foreign_key: true
        t.references :tude_tester_scenario, foreign_key: true
      end
    end
  end
end
