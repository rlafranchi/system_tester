class CreateSystemTesterScenarios < ActiveRecord::Migration[5.1]
  def change
    if Rails.env.system_tester?
      create_table :system_tester_scenarios do |t|
        t.string :title
        t.references :system_tester_feature, foreign_key: true
      end
    end
  end
end
