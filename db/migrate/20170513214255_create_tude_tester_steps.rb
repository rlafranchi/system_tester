class CreateTudeTesterSteps < ActiveRecord::Migration[5.1]
  def change
    if Rails.env.tude_tester?
      create_table :tude_tester_steps do |t|
        t.string :title
        t.string :type
        t.string :arg_one
        t.string :arg_two
      end
    end
  end
end
