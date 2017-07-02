class CreateSystemTesterScenarios < ActiveRecord::Migration[5.1]
  def change
    create_table :system_tester_scenarios do |t|
      t.string :title
      t.references :system_tester_feature, foreign_key: true
      t.timestamps
    end
  end
end
