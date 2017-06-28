class CreateSystemTesterSteps < ActiveRecord::Migration[5.1]
  def change
    if Rails.env.system_tester?
      create_table :system_tester_steps do |t|
        t.string :title
        t.string :type
        t.string :arg_one
        t.string :arg_two
      end
    end
  end
end
