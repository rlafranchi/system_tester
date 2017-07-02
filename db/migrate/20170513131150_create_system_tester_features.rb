class CreateSystemTesterFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :system_tester_features do |t|
      t.string :title
      t.timestamps
    end
  end
end
