class CreateExamples < ActiveRecord::Migration[5.1]
  def change
    create_table :examples do |t|
      t.string :title
      t.text :comment

      t.timestamps
    end
  end
end
