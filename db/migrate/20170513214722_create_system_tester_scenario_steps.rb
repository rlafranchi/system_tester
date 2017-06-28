class CreateSystemTesterScenarioSteps < ActiveRecord::Migration[5.1]
  def change
    if Rails.env.system_tester?
      create_table :system_tester_scenario_steps do |t|
        t.integer :position
        t.references :system_tester_step, foreign_key: true
        t.references :system_tester_scenario, foreign_key: true, index: {name: "index_st_st_scenario_id"}
      end
    end
  end
end
