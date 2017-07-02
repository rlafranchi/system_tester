class CreateSystemTesterSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :system_tester_steps do |t|
      t.string :title
      t.string :type
      t.string :arg_one
      t.string :arg_two
      t.timestamps
    end
  end
end
