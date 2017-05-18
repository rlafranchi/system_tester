class CreateTudeTesterFeatures < ActiveRecord::Migration[5.1]
  def change
    if Rails.env.tude_tester?
      create_table :tude_tester_features do |t|
        t.string :title
      end
    end
  end
end
