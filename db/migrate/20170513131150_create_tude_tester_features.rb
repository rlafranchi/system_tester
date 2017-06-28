class CreateSystemTesterFeatures < ActiveRecord::Migration[5.1]
  def change
    if Rails.env.system_tester?
      create_table :system_tester_features do |t|
        t.string :title
      end
    end
  end
end
