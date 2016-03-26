class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :sake_id
      t.integer :user_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
