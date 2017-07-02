class CreateSystemTesterScenarioSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :system_tester_scenario_steps do |t|
      t.integer :position
      t.references :system_tester_step, foreign_key: true
      t.references :system_tester_scenario, foreign_key: true, index: {name: "index_st_st_scenario_id"}
      t.timestamps
    end
  end
end
