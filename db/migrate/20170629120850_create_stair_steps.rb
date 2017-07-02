class CreateStairSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :system_tester_stair_steps do |t|
      t.integer :position
      t.references :system_tester_step, foreign_key: true
      t.references :system_tester_stair, foreign_key: { to_table: :system_tester_steps }
      t.timestamps
    end
  end
end
