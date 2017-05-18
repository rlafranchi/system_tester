class CreateTudeTesterScenarios < ActiveRecord::Migration[5.1]
  def change
    if Rails.env.tude_tester?
      create_table :tude_tester_scenarios do |t|
        t.string :title
        t.references :tude_tester_feature, foreign_key: true
      end
    end
  end
end
